/**
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
#include"./Headers/main.h"
#include"./Headers/limiters.h"

extern par_ par;
extern double *U;
extern double *U1;
extern double *U2;
extern double *Fm;
extern double *Fp;
extern double *A;
extern double *Gp;
extern double *Gm;

int RK1D(double *dt, double *dx, int order)
{
	int n, i;
	int eq  = par.eq;
	//int dim = par.dim;
	int Nx  = par.xmesh;
	double L[eq], F[eq];

	alloc_flux();
	l = alloc_lim();

	for(i = 1; i <= Nx-1; i++)
	{
		switch(order)
		{
			case 1:
				AMATRIX1D(U,A,i);
				RECONST1D(U,i);
				FLUX1D(Fp,Fm);
		
				for(n = 0; n < eq; n++)
				{
					F[n] = (Fp[n] - Fm[n])/(*dx);
				}
		
				MxV(A,F,L);
		
					for(n = 0; n < eq; n++)
					{
						U1[c1(n,i)] = U[c1(n,i)] - (*dt)*(L[n]);
					}
			break;

			case 2:
				AMATRIX1D(U1,A,i);
				RECONST1D(U1,i);
				FLUX1D(Fp,Fm);
		
				for(n = 0; n < eq; n++)
				{
					F[n] = (Fp[n] - Fm[n])/(*dx);
				}
		
				MxV(A,F,L);
			
				for(n = 0; n < eq; n++)
				{
					U2[c1(n,i)] = 0.5*(U1[c1(n,i)] +  U[c1(n,i)] - (*dt)*(L[n]));
				}
			break;
		}
	}

	free_lim(l);	
	free_flux();
	return 0;	
}

int RK2D(double *dt, double *dx, double *dy, int order)
{
	int n, i, j;
	int eq  = par.eq;
	//int dim = par.dim;
	int Nx  = par.xmesh;
	int Ny  = par.ymesh;
	double L[eq], F[eq];

	alloc_flux();
	l = alloc_lim();

	for(i = 1; i <= Nx-1; i++)
	{
		for(j = 1; j <= Ny-1; j++)
		{
			AMATRIX2D(U,A,i,j);
			RECONST2D(U,i,j);
			FLUX2D(Fp,Fm,Gp,Gm);
	
			for(n = 0; n < eq; n++)
			{
				F[n] = (Fp[n] - Fm[n])/(*dx) + (Gp[n] - Gm[n])/(*dy);
			}

			MxV(A,F,L);
				
			switch(order)
			{
				case 1:
					for(n = 0; n < eq; n++)
					{
						U1[c2(n,i,j)] = U[c2(n,i,j)] - (*dt)*L[n];
					}
				break;

				case 2:
					for(n = 0; n < eq; n++)
					{
						U2[c2(n,i,j)] = 0.5*(U1[c2(n,i,j)] + U[c2(n,i,j)] - (*dt)*L[n]);
					}
				break;
			}
		}	
	}
	
	free_lim(l);
	free_flux();	
	return 0;
}

int MxV(double *M, double *V, double *L)
{
   int n, m;
   int eq = par.eq;
   double res=0.0;

   for(m = 0; m < eq; m++)
   {
      for(n = 0; n < eq; n++)
      {
         res = res + M[m*eq + n]*V[n];
      }

      L[m] = res;
      res = 0.0;
   }

   return 0;
}
