import math
import numpy as np
from mpl_toolkits import mplot3d
import matplotlib.pyplot as plt

def rot_mat(ax, ang):
    ax = np.array(ax)
    ax = ax / math.sqrt(np.dot(ax, ax))
    ang1 = math.pi*ang/180
    c = math.cos(ang1)
    s = math.sin(ang1)
    ux = ax[0]
    uy = ax[1]
    uz = ax[2]

    return np.array([[c+ux**2*(1-c), ux*uy*(1-c)-uz*s, ux*uz*(1-c)+uy*s],
                     [ux*uy*(1-c)+uz*s, c+uy**2*(1-c), uy*uz*(1-c)-ux*s],
                     [ux*uz*(1-c)-uy*s, uy*uz*(1-c)+ux*s, c+uz**2*(1-c)]])

chain1 = [' A',' B',' C',' D',' E']
chain2 = [' F',' G',' H',' I',' J']
chains = [chain1,chain2]
name_set = [' ','A']
n = []
c = []
for chain in chains:
    xcoordvector = []
    ycoordvector = []
    zcoordvector = []
    with open("120mer_cage/120mer_cage.pdb", "r") as file:
        for i in file:
            typ = str(i)[0:4]
            nam = str(i)[16:17]
            cha_pos = str(i)[20:22]
            if (typ == 'ATOM') and (nam in name_set) and (cha_pos in chain) :
                xcoordvector.append(str(i)[30:38])
                ycoordvector.append(str(i)[38:46])
                zcoordvector.append(str(i)[46:54])
    xcoorp = list(map(float, xcoordvector))
    ycoorp = list(map(float, ycoordvector))
    zcoorp = list(map(float, zcoordvector))
    cx = sum(xcoorp)/len(xcoorp)
    cy = sum(ycoorp)/len(ycoorp)
    cz = sum(zcoorp)/len(zcoorp)
    x = np.array(xcoorp) - cx
    y = np.array(ycoorp) - cy
    z = np.array(zcoorp) - cz
    M = np.array([x,y,z])
    U, S, V = np.linalg.svd(M)
    n1 = [U[0,0], U[1,0], U[2,0]]
    n2 = [U[0,1], U[1,1], U[2,1]]   
    nor = np.cross(n2,n1)
    n.append([nor[0], nor[1], nor[2]])
    c.append([cx, cy, cz])
print(c)
print(n)
c1 = np.array(c[0][:])
c2 = np.array(c[1][:])
n1 = np.array(n[0][:])
n2 = np.array(n[1][:])
G1 = np.array(np.cross(n1,c1-c2))
G2 = np.array(np.cross(n2,c2-c1))

tor = 180*math.acos(np.dot(G1,G2)/np.linalg.norm(G1, 2)/np.linalg.norm(G2, 2))/math.pi
if tor > 90:
    tor = 180-tor
print(tor)
Ro = rot_mat(c1-c2, tor)
F1 = np.dot(Ro, n2) + c2
F2 = n1
H1 = np.cross(n1,c2-c1)
H2 = np.cross(F1-c2,c1-c2)
san = np.dot(H1,H2)/np.linalg.norm(H1, 2)/np.linalg.norm(H2, 2)
if abs(san) < 1:
    ang2 = 180*math.acos(san)/math.pi
    if ang2 > 90:
        ang2 = 180-ang2
else:
    ang2 = 0
if ang2 < 0.1:
    bend = 180*math.acos(np.dot(F1-c2,F2)/np.linalg.norm(F1-c2, 2)/np.linalg.norm(F2, 2))/math.pi
    if bend > 90:
        bend = 180-bend
else:
    Ro = rot_mat(c1-c2, -tor)
    F1 = np.dot(Ro, n2) + c2
    F2 = n1
    bend = 180*math.acos(np.dot(F1-c2,F2)/np.linalg.norm(F1-c2, 2)/np.linalg.norm(F2, 2))/math.pi
    if bend > 90:
        bend = 180-bend
print(bend)

fig = plt.figure()
ax = plt.axes(projection='3d')
ax.plot3D([c1[0], c1[0]+10*n1[0]], [c1[1], c1[1]+10*n1[1]], [c1[2], c1[2]+10*n1[2]], 'r')
ax.plot3D([c2[0], c2[0]+10*n2[0]], [c2[1], c2[1]+10*n2[1]], [c2[2], c2[2]+10*n2[2]], 'b')
ax.plot3D([c2[0], c1[0]], [c2[1], c1[1]], [c2[2], c1[2]], 'k:')
ax.plot3D([c2[0], 10*F1[0]-9*c2[0]], [c2[1], 10*F1[1]-9*c2[1]], [c2[2], 10*F1[2]-9*c2[2]], 'm')
plt.show()
file.close()