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
#include<gsl/gsl_matrix.h>
#include<gsl/gsl_blas.h>
#include"./Headers/main.h"

par_ par;

int ReadData()
{
	FILE *file;
	int data;
	float data_f;
	char data_c;
	char test[30];
	file = fopen("INPUT","r");

	fscanf(file,"%s %d",test,&data);
	par.xmesh = data;

	fscanf(file,"%s %d",test,&data);
	par.ymesh = data;
	
	fscanf(file,"%s %d",test,&data);
	par.zmesh = data;
	
	fscanf(file,"%s %d",test,&data);
	par.eq = data;

	fscanf(file,"%s %f",test,&data_f);
	par.xmax = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.ymax = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.zmax = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.xmin = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.ymin = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.zmin = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.n1 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.n2 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.vx1 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.vx2 = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.vy1 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.vy2 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.vz1 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.vz2 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.p1 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.p2 = data_f;
	
	fscanf(file,"%s %f",test,&data_f);
	par.tmax = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.timefile = data_f;
	
	fscanf(file,"%s %d",test,&data);
	par.graf = data;

	fscanf(file,"%s %d",test,&data);
	par.dim = data;

	fscanf(file,"%s %c",test,&data_c);
	par.lim = data_c;

	fscanf(file,"%s %f",test,&data_f);
	par.cou = data_f;

	fscanf(file,"%s %f",test,&data_f);
	par.k = data_f;

	fclose(file);
	return 0;
}



