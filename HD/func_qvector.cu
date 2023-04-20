#include<stdio.h>
#include<math.h>
double funct_Q(double n, double p, double u, double v, double w, double k, int i)
{
   double a;
   if(i == 0)
   {
      a = n;
   }
   else if(i == 1)
   {
      a = ((k-1)*n*pow(w,2.0)+(k-1)*n*pow(v,2.0)+(k-1)*n*pow(u,2.0)+2*p)/(2*k-2);
   }
   else if(i == 2)
   {
      a = n*u;
   }
   else if(i == 3)
   {
      a = n*v;
   }
   else if(i == 4)
   {
      a = n*w;
   }
   return a;
}
