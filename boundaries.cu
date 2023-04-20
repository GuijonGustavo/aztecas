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


extern par_ par;

int BOUNDARIES(double *U)
{
	//int n, i, j, k;
	int i, j;
	int dim = par.dim;
	//int eq  = par.eq;
	int Nx  = par.xmesh;
	int Ny  = par.ymesh;
	//int Nz  = par.zmesh;

	if(dim == 1)
	{	
      U[c1(0,1)] = U[c1(0,2)];
      U[c1(1,1)] = U[c1(1,2)];
      U[c1(2,1)] = U[c1(2,2)];

      U[c1(0,0)] = U[c1(0,1)];
      U[c1(1,0)] = U[c1(1,1)];
      U[c1(2,0)] = U[c1(2,1)];

      U[c1(0,Nx-1)] = U[c1(0,Nx-2)];
      U[c1(1,Nx-1)] = U[c1(1,Nx-2)];
      U[c1(2,Nx-1)] = U[c1(2,Nx-2)];

      U[c1(0,Nx)] = U[c1(0,Nx-1)];
      U[c1(1,Nx)] = U[c1(1,Nx-1)];
      U[c1(2,Nx)] = U[c1(2,Nx-1)];
	}
	else if(dim == 2)
	{
		for(i = 0; i <= Nx; i++)
		{
	//		U[c2(0,i,1)] = U[c2(0,i,2)];
	//		U[c2(1,i,1)] = U[c2(1,i,2)];
	//		U[c2(2,i,1)] = U[c2(2,i,2)];
	//		U[c2(3,i,1)] = U[c2(3,i,2)];

			U[c2(0,i,0)] = U[c2(0,i,1)];
			U[c2(1,i,0)] = U[c2(1,i,1)];
			U[c2(2,i,0)] = U[c2(2,i,1)];
			U[c2(3,i,0)] = -U[c2(3,i,1)];

	//		U[c2(0,i,Ny-1)] = U[c2(0,i,Ny-2)];
	//		U[c2(1,i,Ny-1)] = U[c2(1,i,Ny-2)];
	//		U[c2(2,i,Ny-1)] = U[c2(2,i,Ny-2)];
	//		U[c2(3,i,Ny-1)] = U[c2(3,i,Ny-2)];

			U[c2(0,i,Ny)] = U[c2(0,i,Ny-1)];
			U[c2(1,i,Ny)] = U[c2(1,i,Ny-1)];
			U[c2(2,i,Ny)] = U[c2(2,i,Ny-1)];
			U[c2(3,i,Ny)] = U[c2(3,i,Ny-1)];
		}
		
		for(j = 0; j <= Ny; j++)
		{
	//		U[c2(0,1,j)] = U[c2(0,2,j)];
	//		U[c2(1,1,j)] = U[c2(1,2,j)];
	//		U[c2(2,1,j)] = U[c2(2,2,j)];
	//		U[c2(3,1,j)] = U[c2(3,2,j)];

			U[c2(0,0,j)] = U[c2(0,1,j)];
			U[c2(1,0,j)] = U[c2(1,1,j)];
			U[c2(2,0,j)] = U[c2(2,1,j)];
			U[c2(3,0,j)] = U[c2(3,1,j)];

	//		U[c2(0,Nx-1,j)] = U[c2(0,Nx-2,j)];
	//		U[c2(1,Nx-1,j)] = U[c2(1,Nx-2,j)];
	//		U[c2(2,Nx-1,j)] = U[c2(2,Nx-2,j)];
	//		U[c2(3,Nx-1,j)] = U[c2(3,Nx-2,j)];

			U[c2(0,Nx,j)] = U[c2(0,Nx-1,j)];
			U[c2(1,Nx,j)] = U[c2(1,Nx-1,j)];
			U[c2(2,Nx,j)] = U[c2(2,Nx-1,j)];
			U[c2(3,Nx,j)] = U[c2(3,Nx-1,j)];
		}
	
	}
	
	return 0;
}

