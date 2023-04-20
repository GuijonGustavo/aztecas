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
#include<gsl/gsl_matrix.h>
#include<gsl/gsl_blas.h>
#include"./Headers/main.h"
#include"./Headers/limiters.h"

extern par_ par;
extern double *qp;
extern double *qm;
extern double *fm;
extern double *fp;

int FLUX1D(double *Fp, double *Fm)
{
	//int n;
	//int eq = par.eq;
	//int Nx = par.xmesh;
	//int dim = par.dim;
	double lp, lm;

	alloc_vec();

	VECTOR(&lp,&lm,1,'f');
	HLL(Fp,lp,lm);
	VECTOR(&lp,&lm,0,'f');
	HLL(Fm,lp,lm);

	free_vec();

	return 0;
}

int FLUX2D(double *Fp, double *Fm, double *Gp, double *Gm)
{
	//int n;
	//int eq = par.eq;
	//int Nx = par.xmesh;
	//int Ny = par.ymesh;
	//int dim = par.dim;
	double lp, lm;

	alloc_vec();

	VECTOR(&lp,&lm,1,'f');
	HLL(Fp,lp,lm);
	VECTOR(&lp,&lm,1,'g');
	HLL(Gp,lp,lm);
	VECTOR(&lp,&lm,0,'f');
	HLL(Fm,lp,lm);
	VECTOR(&lp,&lm,0,'g');
	HLL(Gm,lp,lm);

	free_vec();

	return 0;
}

int HLL(double *f, double lp, double lm)
{
	int n;
	int eq = par.eq;
   double q[eq];

	for(n = 0; n < eq; n++)
	{
		q[n] = lp*lm*(qp[n] - qm[n]);
	}

   if(lm < 0 && lp > 0)
   {
		for(n = 0; n < eq; n++)
		{
			f[n] = (lp*fm[n] - lm*fp[n] + q[n])/(lp - lm); 
		}
   }
   else if(lm >= 0)
   {
		for(n = 0; n < eq; n++)
		{
			f[n] = fm[n];
		}
   }
   else if(lp <= 0)
   {
		for(n = 0; n < eq; n++)
		{
			f[n] = fp[n];
		}
   }

   return 0;
}
