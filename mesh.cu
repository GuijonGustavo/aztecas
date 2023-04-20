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
#include<string.h>
#include"./Headers/main.h"

extern par_ par;
extern double *X;
extern double *Y;
extern double *Z;

int MESH(double *dx, double *dy, double *dz)
{
	int i, j, k;
	int Nx = par.xmesh;
	int Ny = par.ymesh;
	int Nz = par.zmesh;
	int dim = par.dim;
	double xmax = par.xmax;
	double ymax = par.ymax;
	double zmax = par.zmax;
   double xmin = par.xmin;
   double ymin = par.ymin;
   double zmin = par.zmin;
	
	*dx = (xmax - xmin)/(double)Nx;
	*dy = (ymax - ymin)/(double)Ny;
	*dz = (zmax - zmin)/(double)Nz;

	if(dim == 1)
	{	
		for(i = 0; i <= Nx; i++)
		{
			X[i] = xmin + i*(*dx); 
		}
	}
	else if(dim == 2)
	{
		for(i = 0; i <= Nx; i++)
		{
			X[i] = xmin + i*(*dx); 
		}
	
		for(j = 0; j <= Ny; j++)
		{
			Y[j] = ymin + j*(*dy);
		}
	}
	else if(dim == 3)
	{
		for(i = 0; i <= Nx; i++)
		{
			X[i] = xmin + i*(*dx); 
		}
	
		for(j = 0; j <= Ny; j++)
		{
			Y[j] = ymin + j*(*dy);
		}
		
		for(k = 0; k <= Nz; k++)
		{
			Z[k] = zmin + k*(*dz); 
		}
	}

	return 0;
}
