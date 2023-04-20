#include<gsl/gsl_matrix.h>

typedef struct
{
	int xmesh, ymesh, zmesh;
	int eq;
	double xmax, ymax, zmax;
	double xmin, ymin, zmin;
	double n1, n2;
	double vx1, vx2;
	double vy1, vy2;
	double vz1, vz2;
	double p1, p2;
	double tmax, timefile;
	int graf;
	int dim;
	char lim;
	double cou;
	double k;
}par_;

//extern par_ par;
//extern double *U, *U1, *U2;
//extern double *X;
//extern double *Y;
//extern double *Z;
//extern double *qp;
//extern double *qm;
//extern double *fp;
//extern double *fm;
//extern double *A;
//extern double *Fp;
//extern double *Fm;
//extern double *Gp;
//extern double *Gm;
//extern double *Hp;
//extern double *Hm;

int ReadData();

void allocateArray();

void allocateEq(double **u);

void alloc_vec();

void free_vec();

void alloc_flux();

void free_flux();

int MESH(double *dx, double *dy, double *dz); 

void INITIAL(double *dx, double *dy, double *dz, double *dtprint, double *tmax);

double TIMESTEP();

int BOUNDARIES(double *U);

int PrintValues(double *time, double *dx, double *dy, double *dz, double *dt, double *tprint, double *dtprint, int *itprint);

int Output1(int *itprint);

int Output2(double *tprint);

int Output3(int *itprint);

int INTEGRATION(double *dx, double *dy, double *dz, double *dt, double *time);

int RK1D(double *dt, double *dx, int order);

int RK2D(double *dt, double *dx, double *dy, int order);

int FLUX1D(double *Fp, double *Fm);

int FLUX2D(double *Fp, double *Fm, double *Gp, double *Gm);

int HLL(double *f, double lr, double ll);

int AMATRIX1D(double *u, double *A, int i);
                                                            
int AMATRIX2D(double *u, double *A, int i, int j);
                                                            
int AMATRIX3D(double *u, double *A, int i, int j, int k);

int VECTOR(double *lp, double *lm, int pm, char f);

int c1(int n, int i);

int c2(int n, int i, int j);

int c3(int n, int i, int j, int k);

int RECONST1D(double *u, int i);

int RECONST2D(double *u, int i, int j);

int VECTOR(double *lr, double *ll, int pm, char f);

int MxV(double *M, double *V, double *L);
