#!/bin/bash

#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.


python<<EOF
import numpy as np
import matplotlib
matplotlib.rcParams['text.usetex'] = True
matplotlib.rcParams['text.latex.unicode'] = True
import matplotlib.pyplot as plt
from matplotlib import colors, ticker, cm

def readinputdata(filename):
		fichero = open(filename,'r')
		f = []
		line = '0'
		while len(line)>0:
			line = np.array(fichero.readline().split()).astype(float)
			if len(line)>0:
				f.append(line)
		fichero.close()
		return np.array(f)


data = readinputdata("DATA_$1_2D.dat")

xx = data[:,0]
yy = data[:,1]
n = data[:,2]
p = data[:,3]
u = data[:,4]
v = data[:,5]

n = n.reshape(101,101)
n = n.T

p = p.reshape(101,101)
p = p.T

u = u.reshape(101,101)
u = u.T

v = v.reshape(101,101)
v = v.T

nx = np.linspace(0, 1, np.sqrt(len(xx)))
ny = np.linspace(0, 1, np.sqrt(len(yy)))
X,Y = np.meshgrid(nx,ny)

plt.rc('font', family='serif')
plt.rc('text', usetex=True)

plt.xlabel(r'\$x\$',fontsize=12)
plt.ylabel(r'\$y\$',fontsize=12)

levels = np.linspace(0.0,np.max(np.abs(n)),400)

cn = plt.contourf(X,Y,np.abs(n),interpolation='sinc',levels=levels,cmap=plt.cm.gist_heat)
cbarn = plt.colorbar(cn, format="%.2f")
cbarn.set_label(r'Density \$n\$',rotation=270,fontsize=12,labelpad=20)
plt.savefig("N$2_py.png")
plt.close()

levels = np.linspace(0,np.max(np.abs(p)),400)

cp = plt.contourf(X,Y,np.abs(p),interpolation='bicubic',levels=levels,cmap=plt.cm.gist_heat)
cbarp = plt.colorbar(cp, format="%.2f")
cbarp.set_label(r'Pressure \$p\$',rotation=270,fontsize=12,labelpad=20)
plt.savefig("P$2_py.png")
plt.close()

levels = np.linspace(0,np.max(np.abs(u)),400)

cu = plt.contourf(X,Y,np.abs(u),interpolation='sinc',levels=levels,cmap=plt.cm.YlOrBr)
cbaru = plt.colorbar(cu, format="%.2f")
cbaru.set_label(r'Velocity \$v_x\$',rotation=270,fontsize=12,labelpad=20)
plt.savefig("Vx$2_py.png")
plt.close()

levels = np.linspace(0,np.max(np.abs(v)),400)

cv = plt.contourf(X,Y,np.abs(v),interpolation='bicubic',levels=levels,cmap=plt.cm.hot)
cbarv = plt.colorbar(cv, format="%.2f")
cbarv.set_label(r'Velocity \$v_y\$',rotation=270,fontsize=12,labelpad=20)
plt.savefig("Vy$2_py.png")
plt.close()

EOF
