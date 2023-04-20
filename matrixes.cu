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
#include"./Headers/matrix.h"
#include"./Headers/vector.h"
#include"./Headers/mod.h"

#define min(a,b) (((a)<(b))?(a):(b))
#define max(a,b) (((a)>(b))?(a):(b))

extern par_ par;
extern double *fm;
extern double *fp;
extern double *qp;
extern double *qm;

int AMATRIX1D(double *u, double *A, int i)
{
	int m, n;
	int eq  = par.eq;
	//int dim = par.dim;
	double K = par.k;
	double N, P, vx=0, vy=0, vz=0;

	N  = u[c1(0,i)];
	P  = u[c1(1,i)];
	vx = u[c1(2,i)];

	for(m = 0; m < eq; m++)
	{
		for(n = 0; n < eq; n++)
		{
			A[m*eq + n] = funct_A(N,P,vx,vy,vz,K,m,n);
		}
	}	

	return 0;
}

int AMATRIX2D(double *u, double *A, int i, int j)
{
	int m, n;
	int eq  = par.eq;
	//int dim = par.dim;
	double K = par.k;
	double N, P, vx=0, vy=0, vz=0;

	N  = u[c2(0,i,j)];
	P  = u[c2(1,i,j)];
	vx = u[c2(2,i,j)];
	vy = u[c2(3,i,j)];

	for(m = 0; m < eq; m++)
	{
		for(n = 0; n < eq; n++)
		{
			A[m*eq + n] = funct_A(N,P,vx,vy,vz,K,m,n);
		}
	}	

	return 0;
}

int AMATRIX3D(double *u, double *A, int i, int j, int k)
{
	int m, n;
	int eq  = par.eq;
	//int dim = par.dim;
	double K = par.k;
	double N, P, vx=0, vy=0, vz=0;

	N  = u[c3(0,i,j,k)];
	P  = u[c3(1,i,j,k)];
	vx = u[c3(2,i,j,k)];
	vy = u[c3(3,i,j,k)];
	vz = u[c3(4,i,j,k)];

	for(m = 0; m < eq; m++)
	{
		for(n = 0; n < eq; n++)
		{
			A[m*eq + n] = funct_A(N,P,vx,vy,vz,K,m,n);
		}
	}	

	return 0;
}

///////////////////////////////////////////////////////////////////////////

int VECTOR(double *lp, double *lm, int pm, char f)
{
	int n;
	int eq = par.eq;
	int dim = par.dim;
	double K = par.k;
	double *u, lr, ll;
   double Np, Pp, vxp=0, vyp=0, vzp=0;
   double Nm, Pm, vxm=0, vym=0, vzm=0;
	gsl_matrix *dp = gsl_matrix_alloc(3,3);
	gsl_matrix *dm = gsl_matrix_alloc(3,3);

   if(pm == 1)
   {
		switch(f)
		{
			case 'f':
				u = l->uxp;
			break;
			
			case 'g':
				u = l->uyp;
			break;
		}
   }
   else
   {
		switch(f)
		{
			case 'f':
				u = l->uxm;
			break;
			
			case 'g':
				u = l->uym;
			break;
		}
   }

	Np  = u[1*eq + 0];
	Pp  = u[1*eq + 1];
	vxp = u[1*eq + 2];

	Nm  = u[0*eq + 0];
	Pm  = u[0*eq + 1];
	vxm = u[0*eq + 2];

	if(dim == 2)
	{
		vyp = u[1*eq + 3];
		vym = u[0*eq + 3];
	}
	else if(dim == 3)
	{
		vyp = u[1*eq + 3];
		vzp = u[1*eq + 4];
		vym = u[0*eq + 3];
		vzm = u[0*eq + 4];
	}

	for(n = 0; n < eq; n++)
	{
		qp[n] = funct_Q(Np,Pp,vxp,vyp,vzp,K,n);
		qm[n] = funct_Q(Nm,Pm,vxm,vym,vzm,K,n);

		switch(f)
		{
			case 'f':
				fp[n] = funct_F(Np,Pp,vxp,vyp,vzp,K,n);
				fm[n] = funct_F(Nm,Pm,vxm,vym,vzm,K,n);
			break;

			case 'g':
				fp[n] = funct_G(Np,Pp,vxp,vyp,vzp,K,n);
				fm[n] = funct_G(Nm,Pm,vxm,vym,vzm,K,n);
			break;
		}
	}	

	for(n = 0; n < 3; n++)
	{
		switch(f)
		{
			case 'f':	
				gsl_matrix_set(dp,n,n,funct_Dm(Np,Pp,vxp,vyp,vzp,K,n,n));
				gsl_matrix_set(dm,n,n,funct_Dm(Nm,Pm,vxm,vym,vzm,K,n,n));
			break;

			case 'g':
				gsl_matrix_set(dp,n,n,funct_Dn(Np,Pp,vxp,vyp,vzp,K,n,n));
				gsl_matrix_set(dm,n,n,funct_Dn(Nm,Pm,vxm,vym,vzm,K,n,n));
			break;	
		}
	}			

	lr = gsl_matrix_max(dp);
	ll = gsl_matrix_max(dm);

	*lp = max(lr,ll);

	lr = gsl_matrix_min(dp);
	ll = gsl_matrix_min(dm);

	*lm = min(lr,ll);

	gsl_matrix_free(dp);
	gsl_matrix_free(dm);

	return 0;
}

///////////////////////////////////////////////////////////////////////////
