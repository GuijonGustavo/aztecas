#include<stdio.h>
#include<math.h>
double funct_F(double n, double p, double u, double v, double w, double k, int i)
{
   double a;
   if(i == 0)
   {
      a = n*u/sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1);
   }
   else if(i == 1)
   {
      a = -(k*p+(k-1)*n)*u/((k-1)*pow(w,2.0)+(k-1)*pow(v,2.0)+(k-1)*pow(u,2.0)-k+1);
   }
   else if(i == 2)
   {
      a = ((k-1)*p*pow(w,2.0)+(k-1)*p*pow(v,2.0)+((1-k)*n-p)*pow(u,2.0)+(1-k)*p)/((k-1)*pow(w,2.0)+(k-1)*pow(v,2.0)+(k-1)*pow(u,2.0)-k+1);
   }
   else if(i == 3)
   {
      a = -(k*p+(k-1)*n)*u*v/((k-1)*pow(w,2.0)+(k-1)*pow(v,2.0)+(k-1)*pow(u,2.0)-k+1);
   }
   else if(i == 4)
   {
      a = -(k*p+(k-1)*n)*u*w/((k-1)*pow(w,2.0)+(k-1)*pow(v,2.0)+(k-1)*pow(u,2.0)-k+1);
   }
   return a;
}
