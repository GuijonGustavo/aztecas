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
double *U;
double *X;
double *Y;
double *Z;

int PrintValues(double *time, double *dx, double *dy, double *dz, double *dt, double *tprint, double *dtprint, int *itprint)
{
	//int n, i, j, k;
	//int eq = par.eq;
   //int Nx = par.xmesh;
//	int Ny = par.ymesh;
//	int Nz = par.zmesh;

	if(*time >= *tprint)
	{
		printf("Time:%.10f ,dt: %f, dx:%f \n", *time, *dt, *dx);

		if(par.graf == 1)
		{
			Output1(itprint);
		}

		else if(par.graf == 2)
		{
			Output2(time);
		}

		else if(par.graf == 3)
		{
			Output3(itprint);
		}
	
		*tprint = *tprint + *dtprint;
		++*itprint;
	}

	*time = *time + *dt;
	return 0;
}

int Output1(int *itprint)
{
	FILE *file;
	//int n, i, j, k;
	int i;
	char ext[20];
	char dat[20];
	char archivo[20];
	int num;

	//int eq = par.eq;
   int Nx = par.xmesh;
//	int Ny = par.ymesh;
	//int Nz = par.zmesh;
	
	num = *itprint;
	strcpy(ext,"_1D.dat");
	snprintf(dat,8,"%d",num);
	strcpy(archivo,"./Data1D/DATA_");
	strcat(archivo,dat);
	strcat(archivo,ext);
	file = fopen(archivo,"w");
	
	for(i = 0; i <= Nx; i++)
	{

      fprintf(file,"%f %f %f %f\n",X[i],\
						U[c1(0,i)],\
						U[c1(1,i)],\
						U[c1(2,i)]);
	}
	
	fclose(file);
	return 0;
}

int Output2(double *tprint)
{
	FILE *file;
	//int n, i, j, k;
	int i, j;
	char ext[20];
	char dat[20];
	char archivo[20];
	double num;

	//int eq = par.eq;
   int Nx = par.xmesh;
	int Ny = par.ymesh;
	//int Nz = par.zmesh;
	
	num = *tprint;
	strcpy(ext,"_2D.dat");
	snprintf(dat,8,"%f",num);
	strcpy(archivo,"./Data2D/DATA_");
	strcat(archivo,dat);
	strcat(archivo,ext);
	file = fopen(archivo,"w");

	for(i = 1; i <= Nx-1; i++)
	{
		for(j = 1; j <= Ny-1; j++)
		{
      	fprintf(file,"%f %f %f %f %f %f\n",X[i],Y[j],U[c2(0,i,j)],\
							U[c2(1,i,j)],\
							U[c2(2,i,j)],\
							U[c2(3,i,j)]);
		}
	}
	
	fclose(file);

	return 0;
}

int Output3(int *itprint)
{
	FILE *file;
	//int n, i, j, k;
	int i, j, k;
	char dat[4];
	char archivo[9];
	int num;
	
//	int eq = par.eq;
   int Nx = par.xmesh;
	int Ny = par.ymesh;
	int Nz = par.zmesh;
	
	num  = *itprint;
	snprintf(dat,4,"%d",num);
	strcpy(archivo,"DATOS");
	strcat(archivo,dat);
	file = fopen(archivo,"w");
	
	for(i = 0; i <= Nx; i++)
	{
		for(j = 0; j <= Ny; j++)
		{
			for(k = 0; k <= Nz; k++)
			{
				fprintf(file,"%f %f %f %f %f %f %f %f\n",X[i],Y[j],Z[k],\
				U[c3(0,i,j,k)],\
				U[c3(1,i,j,k)],\
				U[c3(2,i,j,k)],\
				U[c3(3,i,j,k)],\
				U[c3(4,i,j,k)]);
			}
		}
	}

	fclose(file);
	return 0;
}

