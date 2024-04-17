clear all
close all
n_h = 3; %the helicity number
n_p = 4; %the periodicity number
cc = sqrt(10+2*sqrt(5))/(sqrt(5)-1);
H = [(n_p-2*n_h)/cc/n_p*2.18,2.18];
P1 = [cos(pi/10), sin(pi/10)];
P2 = [cos(2*pi/5+pi/10), sin(2*pi/5+pi/10)];
P3 = [cos(4*pi/5+pi/10), sin(4*pi/5+pi/10)];
P4 = [cos(6*pi/5+pi/10), sin(6*pi/5+pi/10)];
P5 = [cos(8*pi/5+pi/10), sin(8*pi/5+pi/10)];
Q1 = P1 + H;
Q2 = P2 + H;
Q3 = P3 + H;
Q4 = P4 + H;
Q5 = P5 + H;

x1 = [Q1(1) 2*Q5(1)-Q1(1)];
x2 = [P1(1) 4*P2(1)-3*P1(1)];
y1 = [Q1(2) 2*Q5(2)-Q1(2)];
y2 = [P1(2) 4*P2(2)-3*P1(2)];
S1 = IntersectionPoint([x1;y1],[x2;y2]);
R1 = [S1(1),S1(2)];
R2 = R1 + P1-P2;
R3 = R1 + P1-P3;
R4 = R1 + P1-P4;
R5 = R1 + P1-P5;
S2 = (R1+R2+R3+R4+R5)/5;
n = norm(R3-R4)/norm(P2-R1);
if (dot(P1-P2,R1-P2) > 0)
    P = ((n+1)*R3-R4)/n - P4; % if R1 is between P1 and P2
else
    P = ((n-1)*R3+R4)/n - P4;
end
%%% First Column
X1_1 = [P1(1) P2(1) P3(1) P4(1) P5(1) P1(1) NaN Q1(1) Q2(1) Q3(1) Q4(1) Q5(1) Q1(1) NaN R1(1) R2(1) R3(1) R4(1) R5(1) R1(1)];
Y1_1 = [P1(2) P2(2) P3(2) P4(2) P5(2) P1(2) NaN Q1(2) Q2(2) Q3(2) Q4(2) Q5(2) Q1(2) NaN R1(2) R2(2) R3(2) R4(2) R5(2) R1(2)];
figure(1)
plot(X1_1,Y1_1,'r','linewidth',2.5)
axis equal
hold on
X2_1 = X1_1 + H(1);
Y2_1 = Y1_1 + H(2);
plot(X2_1,Y2_1,'b','linewidth',2.5)
hold on
X3_1 = X1_1 + 2*H(1);
Y3_1 = Y1_1 + 2*H(2);
plot(X3_1,Y3_1,'color','[0 0.5 0]','linewidth',2.5)
hold on
X4_1 = X1_1 + 3*H(1);
Y4_1 = Y1_1 + 3*H(2);
plot(X4_1,Y4_1,'r','linewidth',2.5)
hold on
%%% Second Column
X1_2 = X1_1 + P(1);
Y1_2 = Y1_1 + P(2);
plot(X1_2,Y1_2,'r','linewidth',2.5)
hold on
X2_2 = X1_2 + H(1);
Y2_2 = Y1_2 + H(2);
plot(X2_2,Y2_2,'b','linewidth',2.5)
hold on
X3_2 = X1_2 + 2*H(1);
Y3_2 = Y1_2 + 2*H(2);
plot(X3_2,Y3_2,'color','[0 0.5 0]','linewidth',2.5)
hold on
X4_2 = X1_2 + 3*H(1);
Y4_2 = Y1_2 + 3*H(2);
plot(X4_2,Y4_2,'r','linewidth',2.5)
hold on
%%% Third Column
X1_3 = X1_1 + 2*P(1);
Y1_3 = Y1_1 + 2*P(2);
plot(X1_3,Y1_3,'r','linewidth',2.5)
hold on
X2_3 = X1_3 + H(1);
Y2_3 = Y1_3 + H(2);
plot(X2_3,Y2_3,'b','linewidth',2.5)
hold on
X3_3 = X1_3 + 2*H(1);
Y3_3 = Y1_3 + 2*H(2);
plot(X3_3,Y3_3,'color','[0 0.5 0]','linewidth',2.5)
hold on
X4_3 = X1_3 + 3*H(1);
Y4_3 = Y1_3 + 3*H(2);
plot(X4_3,Y4_3,'r','linewidth',2.5)
hold on
%%% Fourth Column
X1_4 = X1_1 + 3*P(1);
Y1_4 = Y1_1 + 3*P(2);
plot(X1_4,Y1_4,'r','linewidth',2.5)
hold on
X2_4 = X1_4 + H(1);
Y2_4 = Y1_4 + H(2);
plot(X2_4,Y2_4,'b','linewidth',2.5)
hold on
X3_4 = X1_4 + 2*H(1);
Y3_4 = Y1_4 + 2*H(2);
plot(X3_4,Y3_4,'color','[0 0.5 0]','linewidth',2.5)
hold on
X4_4 = X1_4 + 3*H(1);
Y4_4 = Y1_4 + 3*H(2);
plot(X4_4,Y4_4,'r','linewidth',2.5)
hold on
%%% Fifth Column
X1_5 = X1_1 + 4*P(1);
Y1_5 = Y1_1 + 4*P(2);
plot(X1_5,Y1_5,'r','linewidth',2.5)
hold on
X2_5 = X1_5 + H(1);
Y2_5 = Y1_5 + H(2);
plot(X2_5,Y2_5,'b','linewidth',2.5)
hold on
X3_5 = X1_5 + 2*H(1);
Y3_5 = Y1_5 + 2*H(2);
plot(X3_5,Y3_5,'color','[0 0.5 0]','linewidth',2.5)
hold on
X4_5 = X1_5 + 3*H(1);
Y4_5 = Y1_5 + 3*H(2);
plot(X4_5,Y4_5,'r','linewidth',2.5)
hold on
plot((P1(1)+P2(1)+P3(1)+P4(1)+P5(1))/5,(P1(2)+P2(2)+P3(2)+P4(2)+P5(2))/5,'.k')
hold on
plot((Q1(1)+Q2(1)+Q3(1)+Q4(1)+Q5(1))/5,(Q1(2)+Q2(2)+Q3(2)+Q4(2)+Q5(2))/5,'.k')
hold on
plot((P1(1)+P2(1)+P3(1)+P4(1)+P5(1))/5+P(1),(P1(2)+P2(2)+P3(2)+P4(2)+P5(2))/5+P(2),'.k')
hold on
plot([n_h*H(1) n_p*P(1)],[n_h*H(2) n_p*P(2)],':k','linewidth',3)
axis off
set(figure(1),'Renderer','painters')