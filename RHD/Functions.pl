#!/bin/perl

sub change 
{
  $a=$_[0];

$a=~s/([a-z])\^(\d)/pow($1,$2.0)/g;

if($a =~ m/\)\^/)
{
 do{
  $i = index($a,")^");
  $j = $i+1;
  my $flag=0;
  my $end = substr($a,$j,1);

      do{
         $j--;

         $end = substr($a,$j,1);
       
          if($end eq ')' )
         {$flag++;}
         elsif($end eq '(' )
         { $flag--;}

         }while $flag != 0;

    substr $a, $j, 1, '<';
    substr $a, $i, 1, '>';
    if($a =~ m/\>\^/)
    {
    $a=~s/<(.+?)>\^(\d)/pow($1, $2.0)/;
    }

    if($a =~ m/\>\^\(/)
    {
    $a=~s/<(.+?)>\^\((\d)\/(\d)\)/pow($1,$2.0\/$3.0)/;
    }

  }while($a =~ m/\)\^/);
}
return $a;
}

########################################################
##Headers##
########################################################

open(Matrix, ">func_matrix.h");
print Matrix "double funct_A(double n, double p, double u, double v, double w, double k, int i, int j);\n";
print Matrix "double funct_Dm(double n, double p, double u, double v, double w, double k, int i, int j);\n";
print Matrix "double funct_Dn(double n, double p, double u, double v, double w, double k, int i, int j);\n";
print Matrix "double funct_Do(double n, double p, double u, double v, double w, double k, int i, int j);\n";
close(Matrix);

open(Matrix, ">func_vector.h");
print Matrix "double funct_Q(double n, double p, double u, double v, double w, double k, int i);\n";
print Matrix "double funct_F(double n, double p, double u, double v, double w, double k, int i);\n";
print Matrix "double funct_G(double n, double p, double u, double v, double w, double k, int i);\n";
print Matrix "double funct_H(double n, double p, double u, double v, double w, double k, int i);\n";
close(Matrix);

open(Matrix, ">func_mod.h");
print Matrix "double funct_Mm(double n, double p, double u, double v, double w, double k, int i, int j);\n";
print Matrix "double funct_Mn(double n, double p, double u, double v, double w, double k, int i, int j);\n";
print Matrix "double funct_Mo(double n, double p, double u, double v, double w, double k, int i, int j);\n";
close(Matrix);

########################################################
##MATRIX A##
########################################################

open(Matrix, 'MATRIX_A');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_amatrix.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_A(double n, double p, double u, double v, double w, double k, int i, int j)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..4){
	foreach my $j (0..4){   
		if($i == 0 && $j==0){
			print Matrix "   if(i == 0 && j == 0)\n";
			print Matrix "   {\n";
			print Matrix "      a = $a[$i*5 + $j]";     
			print Matrix "   }\n";
		}
		else{
			print Matrix "   else if(i == $i && j == $j)\n";
			print Matrix "   {\n";                                
			print Matrix "      a = $a[$i*5 + $j]";     
			print Matrix "   }\n";
		}
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MATRIX Dm##
########################################################

open(Matrix, 'MATRIX_Dm');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_dmmatrix.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Dm(double n, double p, double u, double v, double w, double k, int i, int j)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){
	if($i == 0){
		print Matrix "   if(i*3 + j == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}  
	else{                                 
		print Matrix "   else if(i*3 + j == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MATRIX Dn##
########################################################

open(Matrix, 'MATRIX_Dn');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_dnmatrix.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Dn(double n, double p, double u, double v, double w, double k, int i, int j)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){
	if($i == 0){
		print Matrix "   if(i*3 + j == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{                                   
		print Matrix "   else if(i*3 + j == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MATRIX Do##
########################################################

open(Matrix, 'MATRIX_Do');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_domatrix.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Do(double n, double p, double u, double v, double w, double k, int i, int j)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){
	if($i == 0){
		print Matrix "   if(i*3 + j == 0)";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{                                   
		print Matrix "   else if(i*3 + j == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##VECTOR Q##
########################################################

open(Matrix, 'VECTOR_Q');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_qvector.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Q(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){                                   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{
		print Matrix "   else if(i == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##VECTOR F##
########################################################

open(Matrix, 'VECTOR_F');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_fvector.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_F(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){                                   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{
		print Matrix "   else if(i == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##VECTOR G##
########################################################

open(Matrix, 'VECTOR_G');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_gvector.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_G(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){                                   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{
		print Matrix "   else if(i == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##VECTOR H##
########################################################

open(Matrix, 'VECTOR_H');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_hvector.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_H(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){                                   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}
	else{
		print Matrix "   else if(i == $i)\n";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MOD M##
########################################################

open(Matrix, 'MOD_M');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_mmod.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Mm(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}                        
	else{        
		print Matrix "   else if(i == $i)";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MOD N##
########################################################

open(Matrix, 'MOD_N');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_nmod.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Mn(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}                        
	else{        
		print Matrix "   else if(i == $i)";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

########################################################
##MOD O##
########################################################

open(Matrix, 'MOD_O');
@lines = <Matrix>;
my $size = @lines;
my $s = $size - 1;
my @a = (0) x @lines;
#print @lines;

foreach my $i (1..$size){
	$a[$i-1] = $lines[$i];
}

foreach my $i (1..$size){
	$a[$i-1] = change $a[$i-1];
}

open(Matrix, ">func_omod.c");
print Matrix "#include<stdio.h>\n";
print Matrix "#include<math.h>\n";

print Matrix "double funct_Mo(double n, double p, double u, double v, double w, double k, int i)\n";
print Matrix "{\n";                                                 
print Matrix "   double a;\n";  
foreach my $i (0..$#a-1){   
	if($i == 0){
		print Matrix "   if(i == 0)\n";
		print Matrix "   {\n";
		print Matrix "      a = $a[$i]";
		print Matrix "   }\n";
	}                        
	else{        
		print Matrix "   else if(i == $i)";
		print Matrix "   {\n";                                
		print Matrix "      a = $a[$i]";     
		print Matrix "   }\n";
	}
}                                    
print Matrix "   return a;\n";                                       
print Matrix "}\n";                                                 
close(Matrix);

