#include<stdio.h>
#include<math.h>
double funct_A(double n, double p, double u, double v, double w, double k, int i, int j)
{
   double a;
   if(i == 0 && j == 0)
   {
      a = 1;
   }
   else if(i == 0 && j == 1)
   {
      a = 0;
   }
   else if(i == 0 && j == 2)
   {
      a = 0;
   }
   else if(i == 0 && j == 3)
   {
      a = 0;
   }
   else if(i == 0 && j == 4)
   {
      a = 0;
   }
   else if(i == 1 && j == 0)
   {
      a = ((k-1)*pow(w,2.0)+(k-1)*pow(v,2.0)+(k-1)*pow(u,2.0))/2;
   }
   else if(i == 1 && j == 1)
   {
      a = k-1;
   }
   else if(i == 1 && j == 2)
   {
      a = (1-k)*u;
   }
   else if(i == 1 && j == 3)
   {
      a = (1-k)*v;
   }
   else if(i == 1 && j == 4)
   {
      a = (1-k)*w;
   }
   else if(i == 2 && j == 0)
   {
      a = -u/n;
   }
   else if(i == 2 && j == 1)
   {
      a = 0;
   }
   else if(i == 2 && j == 2)
   {
      a = 1/n;
   }
   else if(i == 2 && j == 3)
   {
      a = 0;
   }
   else if(i == 2 && j == 4)
   {
      a = 0;
   }
   else if(i == 3 && j == 0)
   {
      a = -v/n;
   }
   else if(i == 3 && j == 1)
   {
      a = 0;
   }
   else if(i == 3 && j == 2)
   {
      a = 0;
   }
   else if(i == 3 && j == 3)
   {
      a = 1/n;
   }
   else if(i == 3 && j == 4)
   {
      a = 0;
   }
   else if(i == 4 && j == 0)
   {
      a = -w/n;
   }
   else if(i == 4 && j == 1)
   {
      a = 0;
   }
   else if(i == 4 && j == 2)
   {
      a = 0;
   }
   else if(i == 4 && j == 3)
   {
      a = 0;
   }
   else if(i == 4 && j == 4)
   {
      a = 1/n;
   }
   return a;
}
