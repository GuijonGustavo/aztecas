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
#include <cuda_runtime.h>
#include "./Headers/Error.h"
#include <time.h>
#include "./Headers/GpuTimer.h"
#include "./Headers/CpuTimer.h"
#include <gsl/gsl_integration.h>
#include <omp.h>
#include"./Headers/main.h"

int main(void)
{
	ReadData(); //Read the input data write on INPUT file
	int itprint;
	double dt, dx, dy, dz;
	double time, tmax, dtprint, tprint;

	//With these functions we allocate the dynamical memory for
	//U[eq][Nx][Ny][Nz], X[Nx], Y[Ny] and Z[Nz] func_planarPOINTER.c
	allocateArray();

	//We set the mesh func_planarMESH.c
	MESH(&dx,&dy,&dz);

	//We set the initial parameters func_planarINITIAL.c
	INITIAL(&dx,&dy,&dz,&dtprint,&tmax);
	tprint  = 0.0; //Initialize printing parameter
	itprint = 0;   //Initialize file numeration
	time    = 0.0; //Initialize time
	dt      = 0.0; //Initialize dt
	
	//while(time <= tmax)
	for(;;)
	{	
		//In this part we compute the time step
		dt = TIMESTEP();
	
		//We print the values: file (DATOS*) and to terminal func_planarOUTPUT.c
		PrintValues(&time,&dx,&dy,&dz,&dt,&tprint,&dtprint,&itprint);
		
		//In here we set the integration method (Finite volume method)
		INTEGRATION(&dx,&dy,&dz,&dt,&time);
	if(time > tmax) break;
	}

//	free(U);
//	free(X);
//	free(Y);
//	free(Z);

	return 0;
}
