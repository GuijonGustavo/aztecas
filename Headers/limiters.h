typedef struct 
{
	double *uxp;
	double *uxm;
	double *sx;
	double *uyp;
	double *uym;
	double *sy;
	double *uzp;
	double *uzm;
	double *sz;
} lim_;

extern lim_* l;

lim_* alloc_lim(); 

void free_lim(lim_* l);

double LIMITER(double A, double B);

double GODUNOV(double A, double B);

double MAXMOD(double A, double B);

double MINMOD(double A, double B);

double MC(double A, double B);

double SUPERBEE(double A, double B);

double MAX(gsl_matrix *A, gsl_matrix *B);

double MIN(gsl_matrix *A, gsl_matrix *B);
