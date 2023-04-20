/*
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

//Do not erase any of these libraries//
#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<string.h>
#include<gsl/gsl_matrix.h>
#include<gsl/gsl_blas.h>
#include"./Headers/main.h"
#include"./Headers/limiters.h"

extern par_ par;
lim_ *l;
int RECONST1D(double *u, int i)
{
	int n;
	int eq = par.eq;
	double dup2, dup1, dum1, dum2;

	for(n = 0; n < eq; n++)
	{
		dum2 = u[c1(n,i-1)] - u[c1(n,i-2)];
		dum1 = u[c1(n,i)]   - u[c1(n,i-1)];
		dup1 = u[c1(n,i+1)] - u[c1(n,i)];
		dup2 = u[c1(n,i+2)] - u[c1(n,i+1)];

		l->sx[0*eq + n] = LIMITER(dum1,dum2);
		l->sx[1*eq + n] = LIMITER(dup1,dum1);
		l->sx[2*eq + n] = LIMITER(dup2,dup1);

		l->uxm[0*eq + n] = u[c1(n,i-1)] + 0.5*l->sx[0*eq + n];
		l->uxm[1*eq + n] = u[c1(n,i)] - 0.5*l->sx[1*eq + n];

		l->uxp[0*eq + n] = u[c1(n,i)] + 0.5*l->sx[1*eq + n];
		l->uxp[1*eq + n] = u[c1(n,i+1)] - 0.5*l->sx[2*eq + n];
	}

	return 0;
}

int RECONST2D(double *u, int i, int j)
{
	int n;
	int eq = par.eq;
	double dup2, dup1, dum1, dum2;

	for(n = 0; n < eq; n++)
	{
		dum2 = u[c2(n,i-1,j)] - u[c2(n,i-2,j)];
		dum1 = u[c2(n,i,j)]   - u[c2(n,i-1,j)];
		dup1 = u[c2(n,i+1,j)] - u[c2(n,i,j)];
		dup2 = u[c2(n,i+2,j)] - u[c2(n,i+1,j)];

		l->sx[0*eq + n] = LIMITER(dum1,dum2);
		l->sx[1*eq + n] = LIMITER(dup1,dum1);
		l->sx[2*eq + n] = LIMITER(dup2,dup1);

		l->uxm[0*eq + n] = u[c2(n,i-1,j)] + 0.5*l->sx[0*eq + n];
		l->uxm[1*eq + n] = u[c2(n,i,j)] - 0.5*l->sx[1*eq + n];

		l->uxp[0*eq + n] = u[c2(n,i,j)] + 0.5*l->sx[1*eq + n];
		l->uxp[1*eq + n] = u[c2(n,i+1,j)] - 0.5*l->sx[2*eq + n];

		dum2 = u[c2(n,i,j-1)] - u[c2(n,i,j-2)];
		dum1 = u[c2(n,i,j)]   - u[c2(n,i,j-1)];
		dup1 = u[c2(n,i,j+1)] - u[c2(n,i,j)];
		dup2 = u[c2(n,i,j+2)] - u[c2(n,i,j+1)];

		l->sy[0*eq + n] = LIMITER(dum1,dum2);
		l->sy[1*eq + n] = LIMITER(dup1,dum1);
		l->sy[2*eq + n] = LIMITER(dup2,dup1);

		l->uym[0*eq + n] = u[c2(n,i,j-1)] + 0.5*l->sy[0*eq + n];
		l->uym[1*eq + n] = u[c2(n,i,j)] - 0.5*l->sy[1*eq + n];

		l->uyp[0*eq + n] = u[c2(n,i,j)] + 0.5*l->sy[1*eq + n];
		l->uyp[1*eq + n] = u[c2(n,i,j+1)] - 0.5*l->sy[2*eq + n];
	}

	return 0;
}

double LIMITER(double A, double B)
{
	double sig;
	char lim = par.lim;

	switch(lim)
	{
		case 'G':
			sig = GODUNOV(A,B);
		break;

		case 'M':
			sig = MINMOD(A,B);
		break;

		case 'C':
			sig = MC(A,B);
		break;

		case 'S':
			sig = SUPERBEE(A,B);
		break;
	}

	return sig;
}

double MAXMOD(double A, double B)
{  
   double sig;
   
   if(A*B <= 0)
   {  
      sig = 0;
   }
   
   if(A*B > 0)
   {  
      if(fabs(A) > fabs(B))
      {
         sig = A;
      }
      
      if(fabs(A) < fabs(B))
      {
         sig = B;
      }
   }
   
   return sig;
}

double MINMOD(double A, double B)
{
   double sig;
   
   if(A*B < 0)
   {  
      sig = 0;
   }
   
   if(A*B >= 0)
   {  
      if(fabs(A) < fabs(B))
      {  
         sig = A;
      }
      
      if(fabs(A) > fabs(B))
      {  
         sig = B;
      }
   }
   
   return sig;
}

double MC(double A, double B)
{
   double sig;
   double C;

   C = (A + B)/2;

   if(A*B <= 0)
   {
      sig = 0;
   }

   if(A*B > 0)
   {
      if(fabs(A) < fabs(B) && 2*fabs(A) < fabs(C))
      {
         sig = 2*A;
      }

      if(fabs(A) > fabs(B) && 2*fabs(B) < fabs(C))
      {
         sig = 2*B;
      }

      if(fabs(C) < 2*fabs(A) && fabs(C) < 2*fabs(B))
      {
         sig= C;
      }
   }

   return sig;
}

double SUPERBEE(double A, double B)
{
   double sig1;
   double sig2;
   double sig;

   sig1 = MINMOD(2*A,B);
   sig2 = MINMOD(A,2*B);

   sig = MAXMOD(sig1,sig2);

   return sig;
}

double GODUNOV(double A, double B)
{
   double sig;

   sig = 0;

   return sig;
}
