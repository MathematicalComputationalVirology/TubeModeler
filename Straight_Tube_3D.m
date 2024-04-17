clear all
close all
n_h = 3; %the helicity number
n_p = 4; %the periodicity number
n_c = 2*n_p; % the number of pentamers plotted in a row.
cc = sqrt(10+2*sqrt(5))/(sqrt(5)-1);
H = [(n_p-2*n_h)/cc/n_p*2.18,2.18];
PP1 = [cos(pi/10), sin(pi/10)];
PP2 = [cos(2*pi/5+pi/10), sin(2*pi/5+pi/10)];
PP3 = [cos(4*pi/5+pi/10), sin(4*pi/5+pi/10)];
PP4 = [cos(6*pi/5+pi/10), sin(6*pi/5+pi/10)];
PP5 = [cos(8*pi/5+pi/10), sin(8*pi/5+pi/10)];
QQ1 = PP1 + H;
QQ2 = PP2 + H;
QQ3 = PP3 + H;
QQ4 = PP4 + H;
QQ5 = PP5 + H;
x1 = [QQ1(1) 2*QQ5(1)-QQ1(1)];
x2 = [PP1(1) 4*PP2(1)-3*PP1(1)];
y1 = [QQ1(2) 2*QQ5(2)-QQ1(2)];
y2 = [PP1(2) 4*PP2(2)-3*PP1(2)];
L1 = [x1;y1];
L2 = [x2;y2];
S = IntersectionPoint(L1,L2);
R1 = [S(1),S(2)];
R2 = R1 + PP1-PP2;
R3 = R1 + PP1-PP3;
R4 = R1 + PP1-PP4;
R5 = R1 + PP1-PP5;
S2 = (R1+R2+R3+R4+R5)/5;
n = norm(R3-R4)/norm(PP2-R1);
if (dot(PP1-PP2,R1-PP2) >= 0)
    P = ((n+1)*R3-R4)/n - PP4;
else
    fprintf('Flipped arms \n')
    P = ((n-1)*R3+R4)/n - PP4;
end

a = (n_p*P(1)-n_h*H(1))/2/pi;

P1 = zeros(n_h,n_c,3);
P2 = zeros(n_h,n_c,3);
P3 = zeros(n_h,n_c,3);
P4 = zeros(n_h,n_c,3);
P5 = zeros(n_h,n_c,3);

theta1 = H(1)/a;
theta2 = S2(1)/a;
theta3 = (2*pi+n_h*theta1)/n_p;

temp = min(180-180*(theta2)/pi, 180-180*(theta2-theta1)/pi);
min_bend = min(temp,180-180*(theta3-theta2)/pi)
radius = a

P1(1,1,:) = [a, cos(pi/10), sin(pi/10)];
P2(1,1,:) = [a, cos(2*pi/5+pi/10), sin(2*pi/5+pi/10)];
P3(1,1,:) = [a, cos(4*pi/5+pi/10), sin(4*pi/5+pi/10)];
P4(1,1,:) = [a, cos(6*pi/5+pi/10), sin(6*pi/5+pi/10)];
P5(1,1,:) = [a, cos(8*pi/5+pi/10), sin(8*pi/5+pi/10)];
[X,Y,Z] = cylinder(a,100);
figure(2)
surf(X,Y,11*Z,'edgecolor','none','facecolor','w','facealpha',0.5)
xlabel('X')
ylabel('Y')
zlabel('Z')
axis equal
axis off
grid on
hold on

Rx_180 = [1 0 0;0 -1 0;0 0 -1];
Q1 = Rx_180 * [P1(1,1,1); P1(1,1,2); P1(1,1,3)];
Q2 = Rx_180 * [P2(1,1,1); P2(1,1,2); P2(1,1,3)];
Q3 = Rx_180 * [P3(1,1,1); P3(1,1,2); P3(1,1,3)];
Q4 = Rx_180 * [P4(1,1,1); P4(1,1,2); P4(1,1,3)];
Q5 = Rx_180 * [P5(1,1,1); P5(1,1,2); P5(1,1,3)];
Rz_theta2 = [cos(theta2) -sin(theta2) 0; sin(theta2) cos(theta2) 0; 0 0 1];
P1(1,2,:) = Rz_theta2 * Q1 + [0;0;S2(2)];
P2(1,2,:) = Rz_theta2 * Q2 + [0;0;S2(2)];
P3(1,2,:) = Rz_theta2 * Q3 + [0;0;S2(2)];
P4(1,2,:) = Rz_theta2 * Q4 + [0;0;S2(2)];
P5(1,2,:) = Rz_theta2 * Q5 + [0;0;S2(2)];

Rz_90 = [cos(theta3) -sin(theta3) 0;sin(theta3) cos(theta3) 0;0 0 1];
P1(1,3,:) = Rz_90 * [P1(1,1,1); P1(1,1,2); P1(1,1,3)] + [0;0;P(2)];
P2(1,3,:) = Rz_90 * [P2(1,1,1); P2(1,1,2); P2(1,1,3)] + [0;0;P(2)];
P3(1,3,:) = Rz_90 * [P3(1,1,1); P3(1,1,2); P3(1,1,3)] + [0;0;P(2)];
P4(1,3,:) = Rz_90 * [P4(1,1,1); P4(1,1,2); P4(1,1,3)] + [0;0;P(2)];
P5(1,3,:) = Rz_90 * [P5(1,1,1); P5(1,1,2); P5(1,1,3)] + [0;0;P(2)];

P1(1,4,:) = Rz_90 * [P1(1,2,1); P1(1,2,2); P1(1,2,3)] + [0;0;P(2)];
P2(1,4,:) = Rz_90 * [P2(1,2,1); P2(1,2,2); P2(1,2,3)] + [0;0;P(2)];
P3(1,4,:) = Rz_90 * [P3(1,2,1); P3(1,2,2); P3(1,2,3)] + [0;0;P(2)];
P4(1,4,:) = Rz_90 * [P4(1,2,1); P4(1,2,2); P4(1,2,3)] + [0;0;P(2)];
P5(1,4,:) = Rz_90 * [P5(1,2,1); P5(1,2,2); P5(1,2,3)] + [0;0;P(2)];

Rz_theta1 = [cos(theta1) -sin(theta1) 0;sin(theta1) cos(theta1) 0;0 0 1];
P1(2,1,:) = Rz_theta1 * [P1(1,1,1); P1(1,1,2); P1(1,1,3)] + [0;0;H(2)];
P2(2,1,:) = Rz_theta1 * [P2(1,1,1); P2(1,1,2); P2(1,1,3)] + [0;0;H(2)];
P3(2,1,:) = Rz_theta1 * [P3(1,1,1); P3(1,1,2); P3(1,1,3)] + [0;0;H(2)];
P4(2,1,:) = Rz_theta1 * [P4(1,1,1); P4(1,1,2); P4(1,1,3)] + [0;0;H(2)];
P5(2,1,:) = Rz_theta1 * [P5(1,1,1); P5(1,1,2); P5(1,1,3)] + [0;0;H(2)];

for j = 3:n_c
    P1(1,j,:) = Rz_90 * [P1(1,j-2,1); P1(1,j-2,2); P1(1,j-2,3)] + [0;0;P(2)];
    P2(1,j,:) = Rz_90 * [P2(1,j-2,1); P2(1,j-2,2); P2(1,j-2,3)] + [0;0;P(2)];
    P3(1,j,:) = Rz_90 * [P3(1,j-2,1); P3(1,j-2,2); P3(1,j-2,3)] + [0;0;P(2)];
    P4(1,j,:) = Rz_90 * [P4(1,j-2,1); P4(1,j-2,2); P4(1,j-2,3)] + [0;0;P(2)];
    P5(1,j,:) = Rz_90 * [P5(1,j-2,1); P5(1,j-2,2); P5(1,j-2,3)] + [0;0;P(2)];
end

for i = 2:n_h+1
    for j = 1:n_c
        P1(i,j,:) = Rz_theta1 * [P1(i-1,j,1); P1(i-1,j,2); P1(i-1,j,3)] + [0;0;H(2)];
        P2(i,j,:) = Rz_theta1 * [P2(i-1,j,1); P2(i-1,j,2); P2(i-1,j,3)] + [0;0;H(2)];
        P3(i,j,:) = Rz_theta1 * [P3(i-1,j,1); P3(i-1,j,2); P3(i-1,j,3)] + [0;0;H(2)];
        P4(i,j,:) = Rz_theta1 * [P4(i-1,j,1); P4(i-1,j,2); P4(i-1,j,3)] + [0;0;H(2)];
        P5(i,j,:) = Rz_theta1 * [P5(i-1,j,1); P5(i-1,j,2); P5(i-1,j,3)] + [0;0;H(2)];
    end
end

for i = 1:n_h+1
    for j = 1:n_c
        if (mod(i,n_h) == 1)
            fill3([P1(i,j,1) P2(i,j,1) P3(i,j,1) P4(i,j,1) P5(i,j,1) P1(i,j,1)], [P1(i,j,2) P2(i,j,2) P3(i,j,2) P4(i,j,2) P5(i,j,2) P1(i,j,2)], [P1(i,j,3) P2(i,j,3) P3(i,j,3) P4(i,j,3) P5(i,j,3) P1(i,j,3)],[0.13 0.54 0.13],'linewidth',3.5)
            hold on
        elseif (mod(i,n_h) == 2)
            fill3([P1(i,j,1) P2(i,j,1) P3(i,j,1) P4(i,j,1) P5(i,j,1) P1(i,j,1)], [P1(i,j,2) P2(i,j,2) P3(i,j,2) P4(i,j,2) P5(i,j,2) P1(i,j,2)], [P1(i,j,3) P2(i,j,3) P3(i,j,3) P4(i,j,3) P5(i,j,3) P1(i,j,3)],[0.39 0.58 0.93],'linewidth',3.5)
            hold on
        elseif (mod(i,n_h) == 3)
            fill3([P1(i,j,1) P2(i,j,1) P3(i,j,1) P4(i,j,1) P5(i,j,1) P1(i,j,1)], [P1(i,j,2) P2(i,j,2) P3(i,j,2) P4(i,j,2) P5(i,j,2) P1(i,j,2)], [P1(i,j,3) P2(i,j,3) P3(i,j,3) P4(i,j,3) P5(i,j,3) P1(i,j,3)],[0 0.5 0],'linewidth',3.5)
            hold on
        else
            fill3([P1(i,j,1) P2(i,j,1) P3(i,j,1) P4(i,j,1) P5(i,j,1) P1(i,j,1)], [P1(i,j,2) P2(i,j,2) P3(i,j,2) P4(i,j,2) P5(i,j,2) P1(i,j,2)], [P1(i,j,3) P2(i,j,3) P3(i,j,3) P4(i,j,3) P5(i,j,3) P1(i,j,3)],[0.85 0.65 0.12],'linewidth',3.5)
            hold on
        end
    end
end
