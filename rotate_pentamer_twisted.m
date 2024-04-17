function out=rotate_pentamer_twisted(n,theta1,theta2,P1,P2,P3,P4,P5)
M2 = (n*P5+P4)/(n+1);
S = (M2 + P4) / 2;
M1 = 2 * S - P3;
M3 = 2 * S - P5;
M4 = 2 * S - P1;
M5 = 2 * S - P2;

% rotate pentamer
x1 = P1.';
x2 = M2.';
y1 = 5*P5.'-4*P1.';
y2 = 5*M1.'-4*M2.';
Q = IntersectionPoint3D([x1;y1],[x2;y2]);
vec1 = (M1+M2+M3+M4+M5)/5-S;
vec2 = cross(Q.'-S,P5-S);
vec = cross(vec2,vec1);
S1 = S;
u = vec/norm(vec);
ux = [0 -u(3) u(2); u(3) 0 -u(1); -u(2) u(1) 0];
Ro = cosd(theta1)*eye(3)+sind(theta1)*ux+(1-cosd(theta1))*(u*u.');
MM1 = Ro * (M1-S1) + S1;
MM2 = Ro * (M2-S1) + S1;
MM3 = Ro * (M3-S1) + S1;
MM4 = Ro * (M4-S1) + S1;
MM5 = Ro * (M5-S1) + S1;
% torsion pentamer
S2 = (MM1+MM2+MM3+MM4+MM5)/5;
tor_vec = (MM1+MM2+MM3+MM4+MM5)/5-(P1+P2+P3+P4+P5)/5;
uu = tor_vec/norm(tor_vec);
uux = [0 -uu(3) uu(2); uu(3) 0 -uu(1); -uu(2) uu(1) 0];
Ro1 = cosd(theta2)*eye(3)+sind(theta2)*uux+(1-cosd(theta2))*(uu*uu.');
V1 = Ro1 * (MM1-S2) + S2;
V2 = Ro1 * (MM2-S2) + S2;
V3 = Ro1 * (MM3-S2) + S2;
V4 = Ro1 * (MM4-S2) + S2;
V5 = Ro1 * (MM5-S2) + S2;
out = [V1,V2,V3,V4,V5];
end
