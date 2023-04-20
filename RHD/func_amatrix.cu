#include<stdio.h>
#include<math.h>
double funct_A(double n, double p, double u, double v, double w, double k, int i, int j)
{
   double a;
   if(i == 0 && j == 0)
   {
      a = -(((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(w,4.0)+(((2*pow(k,2.0)-2*k)*p+(2*pow(k,2.0)-4*k+2)*n)*pow(v,2.0)+((2*pow(k,2.0)-2*k)*p+(2*pow(k,2.0)-4*k+2)*n)*pow(u,2.0)-pow(k,2.0)*p+(k-pow(k,2.0))*n)*pow(w,2.0)+((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(v,4.0)+(((2*pow(k,2.0)-2*k)*p+(2*pow(k,2.0)-4*k+2)*n)*pow(u,2.0)-pow(k,2.0)*p+(k-pow(k,2.0))*n)*pow(v,2.0)+((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(u,4.0)+((k-pow(k,2.0))*n-pow(k,2.0)*p)*pow(u,2.0)+k*p+(k-1)*n)/(sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1)*((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n));
   }
   else if(i == 0 && j == 1)
   {
      a = -((pow(k,2.0)-k)*n*pow(w,2.0)+(pow(k,2.0)-k)*n*pow(v,2.0)+(pow(k,2.0)-k)*n*pow(u,2.0))/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 0 && j == 2)
   {
      a = ((pow(k,2.0)-2*k+1)*n*u*pow(w,2.0)+(pow(k,2.0)-2*k+1)*n*u*pow(v,2.0)+(pow(k,2.0)-2*k+1)*n*pow(u,3.0)+(k-1)*n*u)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 0 && j == 3)
   {
      a = ((pow(k,2.0)-2*k+1)*n*v*pow(w,2.0)+(pow(k,2.0)-2*k+1)*n*pow(v,3.0)+((pow(k,2.0)-2*k+1)*n*pow(u,2.0)+(k-1)*n)*v)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 0 && j == 4)
   {
      a = ((pow(k,2.0)-2*k+1)*n*pow(w,3.0)+((pow(k,2.0)-2*k+1)*n*pow(v,2.0)+(pow(k,2.0)-2*k+1)*n*pow(u,2.0)+(k-1)*n)*w)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 1 && j == 0)
   {
      a = -(((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(w,2.0)+((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(v,2.0)+((pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)*pow(u,2.0)+(k-pow(k,2.0))*p+(-pow(k,2.0)+2*k-1)*n)/(sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1)*((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n));
   }
   else if(i == 1 && j == 1)
   {
      a = -((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)+(pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 1 && j == 2)
   {
      a = ((2*pow(k,2.0)-2*k)*p+(pow(k,2.0)-2*k+1)*n)*u/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 1 && j == 3)
   {
      a = ((2*pow(k,2.0)-2*k)*p+(pow(k,2.0)-2*k+1)*n)*v/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 1 && j == 4)
   {
      a = ((2*pow(k,2.0)-2*k)*p+(pow(k,2.0)-2*k+1)*n)*w/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 2 && j == 0)
   {
      a = -((pow(k,2.0)-2*k+1)*u*pow(w,4.0)+((2*pow(k,2.0)-4*k+2)*u*pow(v,2.0)+(2*pow(k,2.0)-4*k+2)*pow(u,3.0)+(-2*pow(k,2.0)+4*k-2)*u)*pow(w,2.0)+(pow(k,2.0)-2*k+1)*u*pow(v,4.0)+((2*pow(k,2.0)-4*k+2)*pow(u,3.0)+(-2*pow(k,2.0)+4*k-2)*u)*pow(v,2.0)+(pow(k,2.0)-2*k+1)*pow(u,5.0)+(-2*pow(k,2.0)+4*k-2)*pow(u,3.0)+(pow(k,2.0)-2*k+1)*u)/(sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1)*((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n));
   }
   else if(i == 2 && j == 1)
   {
      a = -((pow(k,2.0)-k)*u*pow(w,2.0)+(pow(k,2.0)-k)*u*pow(v,2.0)+(pow(k,2.0)-k)*pow(u,3.0)+(k-pow(k,2.0))*u)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 2 && j == 2)
   {
      a = -((pow(k,3.0)-2*pow(k,2.0)+k)*p*pow(w,4.0)+((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p*pow(v,2.0)+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n*pow(u,2.0)+(pow(k,2.0)-pow(k,3.0))*p+(-pow(k,2.0)+2*k-1)*n)*pow(w,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*p*pow(v,4.0)+((-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n*pow(u,2.0)+(pow(k,2.0)-pow(k,3.0))*p+(-pow(k,2.0)+2*k-1)*n)*pow(v,2.0)+((-pow(k,3.0)+2*pow(k,2.0)-k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*pow(u,4.0)+((pow(k,3.0)-3*pow(k,2.0)+2*k)*p+(pow(k,3.0)-4*pow(k,2.0)+5*k-2)*n)*pow(u,2.0)+(pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 2 && j == 3)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*v*pow(w,2.0)+((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(v,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,3.0)+((-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*u)*v)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 2 && j == 4)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(w,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(v,2.0)+((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,3.0)+((-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*u)*w)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 3 && j == 0)
   {
      a = -((pow(k,2.0)-2*k+1)*v*pow(w,4.0)+((2*pow(k,2.0)-4*k+2)*pow(v,3.0)+((2*pow(k,2.0)-4*k+2)*pow(u,2.0)-2*pow(k,2.0)+4*k-2)*v)*pow(w,2.0)+(pow(k,2.0)-2*k+1)*pow(v,5.0)+((2*pow(k,2.0)-4*k+2)*pow(u,2.0)-2*pow(k,2.0)+4*k-2)*pow(v,3.0)+((pow(k,2.0)-2*k+1)*pow(u,4.0)+(-2*pow(k,2.0)+4*k-2)*pow(u,2.0)+pow(k,2.0)-2*k+1)*v)/(sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1)*((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n));
   }
   else if(i == 3 && j == 1)
   {
      a = -((pow(k,2.0)-k)*v*pow(w,2.0)+(pow(k,2.0)-k)*pow(v,3.0)+((pow(k,2.0)-k)*pow(u,2.0)-pow(k,2.0)+k)*v)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 3 && j == 2)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*v*pow(w,2.0)+((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(v,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,3.0)+((-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*u)*v)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 3 && j == 3)
   {
      a = -((pow(k,3.0)-2*pow(k,2.0)+k)*p*pow(w,4.0)+((-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n*pow(v,2.0)+(2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p*pow(u,2.0)+(pow(k,2.0)-pow(k,3.0))*p+(-pow(k,2.0)+2*k-1)*n)*pow(w,2.0)+((-pow(k,3.0)+2*pow(k,2.0)-k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*pow(v,4.0)+((-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n*pow(u,2.0)+(pow(k,3.0)-3*pow(k,2.0)+2*k)*p+(pow(k,3.0)-4*pow(k,2.0)+5*k-2)*n)*pow(v,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*p*pow(u,4.0)+((pow(k,2.0)-pow(k,3.0))*p+(-pow(k,2.0)+2*k-1)*n)*pow(u,2.0)+(pow(k,2.0)-k)*p+(pow(k,2.0)-2*k+1)*n)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 3 && j == 4)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*v*pow(w,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(v,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,2.0)+(-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*v)*w)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 4 && j == 0)
   {
      a = -((pow(k,2.0)-2*k+1)*pow(w,5.0)+((2*pow(k,2.0)-4*k+2)*pow(v,2.0)+(2*pow(k,2.0)-4*k+2)*pow(u,2.0)-2*pow(k,2.0)+4*k-2)*pow(w,3.0)+((pow(k,2.0)-2*k+1)*pow(v,4.0)+((2*pow(k,2.0)-4*k+2)*pow(u,2.0)-2*pow(k,2.0)+4*k-2)*pow(v,2.0)+(pow(k,2.0)-2*k+1)*pow(u,4.0)+(-2*pow(k,2.0)+4*k-2)*pow(u,2.0)+pow(k,2.0)-2*k+1)*w)/(sqrt(-pow(w,2.0)-pow(v,2.0)-pow(u,2.0)+1)*((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n));
   }
   else if(i == 4 && j == 1)
   {
      a = -((pow(k,2.0)-k)*pow(w,3.0)+((pow(k,2.0)-k)*pow(v,2.0)+(pow(k,2.0)-k)*pow(u,2.0)-pow(k,2.0)+k)*w)/((pow(k,2.0)-k)*p*pow(w,2.0)+(pow(k,2.0)-k)*p*pow(v,2.0)+(pow(k,2.0)-k)*p*pow(u,2.0)-k*p+(1-k)*n);
   }
   else if(i == 4 && j == 2)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(w,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*u*pow(v,2.0)+((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,3.0)+((-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*u)*w)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 4 && j == 3)
   {
      a = (((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*v*pow(w,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(v,3.0)+(((2*pow(k,3.0)-4*pow(k,2.0)+2*k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(u,2.0)+(-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+3*pow(k,2.0)-3*k+1)*n)*v)*w)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   else if(i == 4 && j == 4)
   {
      a = (((pow(k,3.0)-2*pow(k,2.0)+k)*p+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n)*pow(w,4.0)+((pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n*pow(v,2.0)+(pow(k,3.0)-3*pow(k,2.0)+3*k-1)*n*pow(u,2.0)+(-pow(k,3.0)+3*pow(k,2.0)-2*k)*p+(-pow(k,3.0)+4*pow(k,2.0)-5*k+2)*n)*pow(w,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*p*pow(v,4.0)+((-2*pow(k,3.0)+4*pow(k,2.0)-2*k)*p*pow(u,2.0)+(pow(k,3.0)-pow(k,2.0))*p+(pow(k,2.0)-2*k+1)*n)*pow(v,2.0)+(-pow(k,3.0)+2*pow(k,2.0)-k)*p*pow(u,4.0)+((pow(k,3.0)-pow(k,2.0))*p+(pow(k,2.0)-2*k+1)*n)*pow(u,2.0)+(k-pow(k,2.0))*p+(-pow(k,2.0)+2*k-1)*n)/(((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(w,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(v,2.0)+((pow(k,3.0)-pow(k,2.0))*pow(p,2.0)+(pow(k,3.0)-2*pow(k,2.0)+k)*n*p)*pow(u,2.0)-pow(k,2.0)*pow(p,2.0)+(2*k-2*pow(k,2.0))*n*p+(-pow(k,2.0)+2*k-1)*pow(n,2.0));
   }
   return a;
}
