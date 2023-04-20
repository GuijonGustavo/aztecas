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
extern double *X;
extern double *U;
extern double *Y;
extern double *Z;
double *qm;
double *fp;
double *fm;
double *qp;
double *A;
double *Fo;
double *Fm;
double *Fp;
double *Gp;
double *Gm;
double *Hp;
double *Hm;



void allocateArray()
{
	int eq = par.eq;
	int Nx = par.xmesh;
	int Ny = par.ymesh;
	int Nz = par.zmesh;
	int dim = par.dim;

	if(dim == 1)
	{
		X = (double *)malloc((Nx+1)*sizeof(double));
		U = (double *)malloc((Nx+1)*(eq+1)*sizeof(double));
	}
	else if(dim == 2)
	{
		X = (double *)malloc((Nx+1)*sizeof(double));
		Y = (double *)malloc((Ny+1)*sizeof(double));
		U = (double *)malloc((Nx+1)*(Ny+1)*(eq+1)*sizeof(double));
	}
	else if(dim == 3)
	{
		X = (double *)malloc((Nx+1)*sizeof(double));
		Y = (double *)malloc((Ny+1)*sizeof(double));
		Z = (double *)malloc((Nz+1)*sizeof(double));
		U = (double *)malloc((Nx+1)*(Ny+1)*(Nz+1)*(eq+1)*sizeof(double));
	}
}

void allocateEq(double **u) 
{
	int eq  = par.eq;
	int Nx  = par.xmesh;
	int Ny  = par.ymesh;
	int Nz  = par.zmesh;
	int dim = par.dim;

	if(dim == 1)
	{
		*u = (double *)malloc((Nx+1)*(eq+1)*sizeof(double));	
	}
	else if(dim == 2)
	{
		*u = (double *)malloc((Ny+1)*(Nx+1)*(eq+1)*sizeof(double));
	}
	else if(dim == 3)
	{
		*u = (double *)malloc((Nz+1)*(Ny+1)*(Nx+1)*(eq+1)*sizeof(double));
	}
	else
	{ 
		printf("Error at dim variable (1,2,3)");
	}
}

void alloc_vec()
{
	int eq = par.eq;

	qp = (double *)malloc((eq+1)*sizeof(double));
	qm = (double *)malloc((eq+1)*sizeof(double));
	fp = (double *)malloc((eq+1)*sizeof(double));
	fm = (double *)malloc((eq+1)*sizeof(double));
}

void free_vec()
{
	free(qp);
	free(qm);
	free(fp);
	free(fm);
}

void alloc_flux()
{
	int eq = par.eq;

	A  = (double *)malloc((eq+1)*(eq+1)*sizeof(double));
	Fp = (double *)malloc((eq+1)*sizeof(double));
	Fm = (double *)malloc((eq+1)*sizeof(double));
	Gp = (double *)malloc((eq+1)*sizeof(double));
	Gm = (double *)malloc((eq+1)*sizeof(double));
	Hp = (double *)malloc((eq+1)*sizeof(double));
	Hm = (double *)malloc((eq+1)*sizeof(double));
}

void free_flux()
{
	free(A);
	free(Fp);
	free(Fm);
	free(Gp);
	free(Gm);
	free(Hp);
	free(Hm);
}

lim_* alloc_lim()
{
	int eq = par.eq;	

	lim_* l = (lim_*) malloc(1*sizeof(lim_));

	l->uxp = (double *)malloc((eq+1)*2*sizeof(double));
	l->uxm = (double *)malloc((eq+1)*2*sizeof(double));
	l->sx  = (double *)malloc((eq+1)*3*sizeof(double));

	l->uyp = (double *)malloc((eq+1)*2*sizeof(double));
	l->uym = (double *)malloc((eq+1)*2*sizeof(double));
	l->sy  = (double *)malloc((eq+1)*3*sizeof(double));

	l->uzp = (double *)malloc((eq+1)*2*sizeof(double));
	l->uzm = (double *)malloc((eq+1)*2*sizeof(double));
	l->sz  = (double *)malloc((eq+1)*3*sizeof(double));

	return l;
}

void free_lim(lim_* l)
{
	free(l->uxp);
	free(l->uxm);
	free(l->sx);

	free(l->uyp);
	free(l->uym);
	free(l->sy);

	free(l->uzp);
	free(l->uzm);
	free(l->sz);
}
