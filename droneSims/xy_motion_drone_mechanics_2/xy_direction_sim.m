% Coaxial Drone Calculations and Simulation
% Andrew North 
% Started code: 7/18/2022, 7/19, 

% Parameters:
L1 = 0.05; %m
L3 = 0.1; %m
m1 = 0.3; % kg
m2 = 0.7; % kg
M = m1+m2; % kg
radius = 0.4; % m
height = 1; % m

% Input:
psi = pi-(1*pi/180); % servo angle
psi_degree = psi*180/pi;

% Calculate theta (measure against gyroscope) 
% calcs based on m1 & m2 aligning vertically
theta = atan((sin(psi))/((L3/L1)-cos(psi)));
theta_degree = theta*180/pi;

% Calculate phi (thrust vector)
phi = theta + psi - pi/2;
phi_degree = phi*180/pi;

% Calculate Forces
fThrust = 10.9; % Newtons

% Numerical Integration
tspan = [0 5];
x0 = [0;0;0;0;0;0];
[t,x] = ode45(@(t,x) droneODE(t,x,fThrust,m1,m2,phi,radius,height,L1,L3),tspan,x0);
    
plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,x(:,5))
yline(0,'--')
title('State vs. Time (\psi = 174^{\circ}, F_{thrust} = 12N)');
xlabel('time (seconds)');
ylabel('position (meters), velocity (m/s)');
legend('x','xDot','y','yDot','\lambda');


g = 9.81;
fG1 = g*m1; % gravity force on mass 1
fG2 = g*m2; % gravity force on mass 2
d1 = (m2/M)*(L1+L3); % distance from m1 to drone center of mass
d2 = (m1/M)*(L1+L3); % distance from m2 to drone center of mass
di = radius*2; % drone diameter in meters
hi = height; % drone height in meters
I = (M/48)*(3*di^2+4*hi^2); % mass moment of intertia of solid cylinder
% Linearized equations for control
A = zeros(6);
A(1,2) = 1;
A(2,5) = -(fThrust/M)*sin(phi);
A(3,4) = 1;
A(4,5) = (fThrust/M)*cos(phi);
A(5,6) = 1;
A(6,5) = (1/I)*(-fG1*d1+fG2*d2);
eig(A)

% Call simulation
for k=1:length(t)
    animateDrone(x(k,:),psi,phi,theta,radius,height);
end

