function Q = IntersectionPoint3D(L1,L2)
% L1 = [P11;P12] % L2 = [P21;P22]
P11 = L1(1,:);
P21 = L2(1,:);
n1 = L1(2,:) - L1(1,:);
n2 = L2(2,:) - L2(1,:);
X = P21 - P11;
a = norm(cross(n2,X));
b = norm(cross(n2,n1));
Q = P11 + sign(cross(n2,X)/cross(n2,n1))*a/b*n1;
end
