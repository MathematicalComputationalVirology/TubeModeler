clear all
close all
n = 9;
P1 = [0; cos(2*pi/5+pi/10); sin(2*pi/5+pi/10)];
P2 = [0; cos(4*pi/5+pi/10); sin(4*pi/5+pi/10)];
P3 = [0; cos(6*pi/5+pi/10); sin(6*pi/5+pi/10)];
P4 = [0; cos(8*pi/5+pi/10); sin(8*pi/5+pi/10)];
P5 = [0; cos(pi/10); sin(pi/10)];
theta1 = 43; %Bendin angle
theta2 = 18; %Twisting angle
fill3([P1(1) P2(1) P3(1) P4(1) P5(1) P1(1)], [P1(2) P2(2) P3(2) P4(2) P5(2) P1(2)], [P1(3) P2(3) P3(3) P4(3) P5(3) P1(3)],'y','linewidth',3.5)
xlabel('X')
ylabel('Y')
zlabel('Z')
axis equal
axis off
hold on
i = 1;
E = zeros(3,13);
E(:,1) = (P1+P2+P3+P4+P5)/5;
while i < 13
    V = rotate_pentamer_twisted(n,theta1,theta2,P1,P2,P3,P4,P5);
    V1 = V(:,1);
    V2 = V(:,2);
    V3 = V(:,3);
    V4 = V(:,4);
    V5 = V(:,5);
    fill3([V1(1) V2(1) V3(1) V4(1) V5(1) V1(1)], [V1(2) V2(2) V3(2) V4(2) V5(2) V1(2)], [V1(3) V2(3) V3(3) V4(3) V5(3) V1(3)],'y','linewidth',3.5)
    hold on
    P1 = V1;
    P2 = V2;
    P3 = V3;
    P4 = V4;
    P5 = V5;
    E(:,i+1) = (P1+P2+P3+P4+P5)/5;
    i = i+1;
end
hold off
alpha(0.7) %make the plot see through