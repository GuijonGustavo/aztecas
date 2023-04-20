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
extern double *U;
extern double *Y;

void INITIAL(double *dx, double *dy, double *dz, double *dtprint, double *tmax)
{
	//int n, i, j, k;
	int i, j, k;
	//int eq = par.eq;
	int Nx = par.xmesh;
	int Ny = par.ymesh;
	int Nz = par.zmesh;
	int dim = par.dim;
	double xmax = par.xmax;
	//double ymax = par.ymax;
	//double zmax = par.zmax;
	double xmin = par.xmin;
	//double ymin = par.ymin;
	//double zmin = par.zmin;

	printf("\nRiemann problem\n");
	if(dim == 1)
	{
		for(i = 0; i <= Nx; i++)
		{	
			if(X[i] < (xmax - xmin)/2.0)
			{
				U[c1(0,i)] = par.n1;
				U[c1(1,i)] = par.p1;
				U[c1(2,i)] = par.vx1;
			}
			else
			{
				U[c1(0,i)] = par.n2;
				U[c1(1,i)] = par.p2;
				U[c1(2,i)] = par.vx2;
			}
		}
	}
	else if(dim == 2)
	{
/*
		FILE *fdata;
		fdata = fopen("DATOS1154","r");

		for(i = 0; i <= Nx; i++)
		{
			for(j = 0; j <= Ny; j++)
			{	
				fscanf(fdata,"%lf %lf %lf %lf %lf %lf",&X[i],&Y[j],&U[0*(Nx+1)*(Ny+1) + i*(Ny+1) + j],&U[1*(Nx+1)*(Ny+1) + i*(Ny+1) + j],&U[2*(Nx+1)*(Ny+1)+ i*(Ny+1) + j],&U[3*(Nx+1)*(Ny+1) + i*(Ny+1) + j]);
			}
		}

		fclose(fdata);
*/

///////////////////////////
//--------Jet------------//
///////////////////////////
/*	
		for(i = 0; i <= Nx; i++)
		{	
			for(j = 0; j <= Ny; j++)
			{
				if(Y[j] == 0)
				{
					if(X[i] < 5.75 && X[i] > 4.25)
					{
						U[c2(0,i,j)] = par.n1;
						U[c2(1,i,j)] = par.p1;
						U[c2(2,i,j)] = par.vx1;
						U[c2(3,i,j)] = par.vy1;
					}
					else
					{
						U[c2(0,i,j)] = par.n2;
						U[c2(1,i,j)] = par.p2;
						U[c2(2,i,j)] = par.vx2;
						U[c2(3,i,j)] = par.vy2;
					}
				}				
				else
				{
					U[c2(0,i,j)] = par.n2;
					U[c2(1,i,j)] = par.p2;
					U[c2(2,i,j)] = par.vx2;
					U[c2(3,i,j)] = par.vy2;
				}
			}
		}
*/
/////////////////////////////

///////////////////////////
//--------Sedov----------//
///////////////////////////

		for(i = 0; i <= Nx; i++)
		{	
			for(j = 0; j <= Ny; j++)
			{
				if(pow(X[i] - 0.5,2.0) + pow(Y[j] - 0.1,2.0) < pow(0.05,2.0))
				{
					U[c2(0,i,j)] = 1.0;
					U[c2(1,i,j)] = 1.0;
					U[c2(2,i,j)] = 0.0;
					U[c2(3,i,j)] = 0.0;
				}
				else
				{
					U[c2(0,i,j)] = 1.0;
					U[c2(1,i,j)] = 0.01;
					U[c2(2,i,j)] = 0.0;
					U[c2(3,i,j)] = 0.0;
				}
			}				
		}

/////////////////////////////

///////////////////////////
//-------Riemann---------//
///////////////////////////
/*
		for(i = 0; i <= Nx; i++)
		{	
			for(j = 0; j <= Ny; j++)
			{
				if(Y[j] < 0.5)
				{
					U[c2(0,i,j)] = par.n1;
					U[c2(1,i,j)] = par.p1;
					U[c2(2,i,j)] = par.vx1;
					U[c2(3,i,j)] = par.vy1;
				}
				else
				{
					U[c2(0,i,j)] = par.n2;
					U[c2(1,i,j)] = par.p2;
					U[c2(2,i,j)] = par.vx2;
					U[c2(3,i,j)] = par.vy2;
				}
			}				
		}
*/
/////////////////////////////
	}
	else if(dim == 3)
	{
		for(i = 0; i <= Nx; i++)
		{	
			for(j = 0; j <= Ny; j++)
			{
				for(k = 0; k <= Nz; k++)
				{
					if(X[i] < (xmax - xmin)/2.0)
					{
						U[c3(0,i,j,k)] = par.n1;
						U[c3(1,i,j,k)] = par.p1;
						U[c3(2,i,j,k)] = par.vx1;
						U[c3(3,i,j,k)] = par.vy1;
						U[c3(4,i,j,k)] = par.vz1;
					}
					else
					{
						U[c3(0,i,j,k)] = par.n2;
						U[c3(1,i,j,k)] = par.p2;
						U[c3(2,i,j,k)] = par.vx2;
						U[c3(3,i,j,k)] = par.vy2;
						U[c3(4,i,j,k)] = par.vz2;
					}
				}
			}
		}
	}	
	else
	{
		printf("ERROR: Variable dim distinta de {1,2,3}");
	}
	
	*tmax    = par.tmax;
	*dtprint = par.timefile;
}

