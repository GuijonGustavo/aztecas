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
extern double *U;
double *U1;
double *U2;

int INTEGRATION(double *dx, double *dy, double *dz, double *dt, double *time)
{
	int dim = par.dim;
	allocateEq(&U1);
	allocateEq(&U2);

	//Runge-Kutta 2th-Order and Piecewie Polynomial Reconstruction
	if(dim == 1)
	{
		RK1D(dt,dx,1);
		BOUNDARIES(U1);
		RK1D(dt,dx,2);
		BOUNDARIES(U2);
		U = U2;
	}
	else if(dim == 2)
	{
		RK2D(dt,dx,dy,1);
		BOUNDARIES(U1);
		RK2D(dt,dx,dy,2);
		BOUNDARIES(U2);
		U = U2;
	}
/*	else if(dim == 3)
	{
		3D-PVRS-RK1();
	}
*/

	return 0;
}
