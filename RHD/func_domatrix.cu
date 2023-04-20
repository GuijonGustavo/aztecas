#include<stdio.h>
#include<math.h>
double funct_Do(double n, double p, double u, double v, double w, double k, int i, int j)
{
   double a;
   if(i*3 + j == 0)   {
      a = -(sqrt(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,4.0)+(((pow(k,4.0)-pow(k,3.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,4.0)-pow(k,3.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)+(2*pow(k,2.0)-2*pow(k,3.0))*pow(p,2.0)+(-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*n*p)*pow(w,2.0)+(pow(k,4.0)-2*pow(k,3.0)+pow(k,2.0))*pow(p,2.0)*pow(v,4.0)+((2*pow(k,4.0)-4*pow(k,3.0)+2*pow(k,2.0))*pow(p,2.0)*pow(u,2.0)+(pow(k,3.0)-pow(k,4.0))*pow(p,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*n*p)*pow(v,2.0)+(pow(k,4.0)-2*pow(k,3.0)+pow(k,2.0))*pow(p,2.0)*pow(u,4.0)+((pow(k,3.0)-pow(k,4.0))*pow(p,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*n*p)*pow(u,2.0)+(pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)+((2*k-pow(k,2.0))*p+(k-1)*n)*w)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i*3 + j == 1)
   {
      a = 0;
   }
   else if(i*3 + j == 2)
   {
      a = 0;
   }
   else if(i*3 + j == 3)
   {
      a = 0;
   }
   else if(i*3 + j == 4)
   {
      a = (sqrt(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,4.0)+(((pow(k,4.0)-pow(k,3.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,4.0)-pow(k,3.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)+(2*pow(k,2.0)-2*pow(k,3.0))*pow(p,2.0)+(-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*n*p)*pow(w,2.0)+(pow(k,4.0)-2*pow(k,3.0)+pow(k,2.0))*pow(p,2.0)*pow(v,4.0)+((2*pow(k,4.0)-4*pow(k,3.0)+2*pow(k,2.0))*pow(p,2.0)*pow(u,2.0)+(pow(k,3.0)-pow(k,4.0))*pow(p,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*n*p)*pow(v,2.0)+(pow(k,4.0)-2*pow(k,3.0)+pow(k,2.0))*pow(p,2.0)*pow(u,4.0)+((pow(k,3.0)-pow(k,4.0))*pow(p,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*n*p)*pow(u,2.0)+(pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)+((pow(k,2.0)-2*k)*p+(1-k)*n)*w)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i*3 + j == 5)
   {
      a = 0;
   }
   else if(i*3 + j == 6)
   {
      a = 0;
   }
   else if(i*3 + j == 7)
   {
      a = 0;
   }
   else if(i*3 + j == 8)
   {
      a = w;
   }
   return a;
}
