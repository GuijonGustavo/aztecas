#include<stdio.h>
#include<math.h>
double funct_Dn(double n, double p, double u, double v, double w, double k, int i, int j)
{
   double a;
   if(i*3 + j == 0)
   {
      a = -(sqrt(k*n*p)-n*v)/n;
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
      a = (n*v+sqrt(k*n*p))/n;
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
      a = v;
   }
   return a;
}
