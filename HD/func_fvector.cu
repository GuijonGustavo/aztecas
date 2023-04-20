#include<stdio.h>
#include<math.h>
double funct_F(double n, double p, double u, double v, double w, double k, int i)
{
   double a;
   if(i == 0)
   {
      a = n*u;
   }
   else if(i == 1)
   {
      a = ((k-1)*n*u*pow(w,2.0)+(k-1)*n*u*pow(v,2.0)+(k-1)*n*pow(u,3.0)+2*k*p*u)/(2*k-2);
   }
   else if(i == 2)
   {
      a = n*pow(u,2.0)+p;
   }
   else if(i == 3)
   {
      a = n*u*v;
   }
   else if(i == 4)
   {
      a = n*u*w;
   }
   return a;
}
