#include<stdio.h>
#include<math.h>
double funct_Mm(double n, double p, double u, double v, double w, double k, int i)
{
   double a;
   if(i == 0)
   {
      a = pow(u,2.0)+pow(n,2.0);
   }
   else if(i == 1)   {
      a = pow(u,2.0)+pow(k,2.0)*pow(p,2.0);
   }
   else if(i == 2)   {
      a = (pow(n,2.0)*pow(u,2.0)+1)/pow(n,2.0);
   }
   else if(i == 3)   {
      a = pow(u,2.0);
   }
   else if(i == 4)   {
      a = pow(u,2.0);
   }
   return a;
}
