function S = IntersectionPoint(L1,L2)
x11 = L1(1,1);
x12 = L1(1,2);
y11 = L1(2,1);
y12 = L1(2,2);
x21 = L2(1,1);
x22 = L2(1,2);
y21 = L2(2,1);
y22 = L2(2,2);
m1 = (y12-y11)/(x12-x11);
m2 = (y22-y21)/(x22-x21);
if abs(m1-m2)>0.000001
    x = (m1*x11-y11-m2*x21+y21)/(m1-m2);
    S = [x,m1*(x-x11)+y11];
else
    S = [];
end
end