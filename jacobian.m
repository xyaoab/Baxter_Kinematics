function [] = jacobian(l1,l2,theta1,theta2)
%JACOBIAN takes in configurations and link lengths of a 2D planar robot
%To plot FK and manipulability ellipse centered at the end-effector 
% theta1, theta in degree not radius
theta1 = deg2rad(theta1);
theta2 = deg2rad(theta2);
x1_mid = l1*cos(theta1);
x2_mid = l1*sin(theta1);
x1 = x1_mid + l2*cos(theta1+theta2);
x2 = x2_mid + l2*sin(theta1+theta2);
figure(1);
plot([0,x1_mid,x1],[0,x2_mid,x2],'-ob');
title("Robot Arm Position");
xlabel("x1");
ylabel("x2");
hold on
% x1_dot = -l1*theta1_dot*sin(theta1) - l2*(theta1_dot+theta2_dot)*sin(theta1+theta2)
% x2_dot = l1*theta1_dot*cos(theta1) + l2*(theta1_dot+theta2_dot)*cos(theta1+theta2)
% Jacobian matrix
J=[-l1*sin(theta1)-l2*sin(theta1+theta2) -l2*sin(theta1+theta2);...
    l1*cos(theta1)+l2*cos(theta1+theta2) l2*cos(theta1+theta2)];
[V,D] = eig(J*J'); %eigenvector = columns of V,  A*V=V*D
eigenvalue = diag(D);

a=eigenvalue(2); % horizontal radius
b=eigenvalue(1); % vertical radius

t=-pi:0.01:pi;
angle = atan2(V(2,2),V(1,2)); % in radius 
x=x1+a*cos(t)*cos(angle)-b*sin(t)*sin(angle);
y=x2+b*sin(t)*cos(angle)+a*cos(t)*sin(angle);
ratio = (max(y)-min(y))/(max(x)-min(x));
plot(x,y);
%title("Manipulability Ellipse");
%xlabel("x1dot");
%ylabel("x2dot");
end

