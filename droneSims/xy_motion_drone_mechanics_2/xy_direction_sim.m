% Coaxial Drone Calculations and Simulation
% Andrew North L1 = 0.05; %m
% Started code: 7/18/2022, 7/19, 

%% Parameters:
L1 = 0.05; %m
L3 = 0.1; %m
m1 = 0.3; % kg
m2 = 0.7; % kg
M = m1+m2; % kg
radius = 0.4; % m
height = 1; % m

% Parameters related to drag
airDensity = 1.225; % kg/m^3 density of the air. Using density at sea level.
drag1 = 0.5; % coefficient of drag (approximated 0.5)
A = 0.3*0.09; % m^2 cross sectional area of drone
drag2 = 0.5*airDensity*drag1*A; % second coefficient of drag to simplify below eqns

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
fThrust = 10; % Newtons

%% Numerical Integration
% tspan = [0 5];
% x0 = [0;0;0;0;0;0];
% xf = [2;0;1.5;0;0;0];
% [t,x] = ode45(@(t,x) droneODE(t,x,fThrust,psi,m1,m2,radius,height,L1,L3),tspan,x0);

% plot(t,x(:,1),t,x(:,2),t,x(:,3),t,x(:,4),t,x(:,5))
% yline(0,'--')
% title('State vs. Time (\psi = 174^{\circ}, F_{thrust} = 12N)');
% xlabel('time (seconds)');
% ylabel('position (meters), velocity (m/s)');
% legend('x','xDot','y','yDot','\lambda');


g = 9.81;
fG1 = g*m1; % gravity force on mass 1
fG2 = g*m2; % gravity force on mass 2
d1 = (m2/M)*(L1+L3); % distance from m1 to drone center of mass
d2 = (m1/M)*(L1+L3); % distance from m2 to drone center of mass
di = radius*2; % drone diameter in meters
hi = height; % drone height in meters
I = (M/48)*(3*di^2+4*hi^2); % mass moment of intertia of solid cylinder

% ---------- Linearized equations for control ---------- %
% Parameters
k = 4E-7; % F_thrust = k*(motor angular veloctiy)

A = [0 1 0 0 0 0;...
    0 (-0.5*drag2)/M 0 0 0 0;...
    0 0 0 1 0 0;...
    0 0 0 (-0.5*drag2)/M 0 0;...
    0 0 0 0 0 1;...
    0 0 0 0 (g/I)*(m2*d2-m1*d1) 0];

% Replaced X(5) with pi (replaced lambda with pi)
B = [0 0;...
    -k*pi -(2/3)*k*5000^2;...
    0 0;...
    k -(2/3)*k*5000^2*pi;...
    0 0;...
    0 (2*k*d1)/(3*I)*5000^2];

% eigs = [-1.1; -1.2; -1.3; -1.4; -1.5; -1.6];
eigs = [-.2; -1.2; 0; -1.4; -1.5; -1.6];
K = place(A,B,eigs);

%% Numerical Integration with controller for U
tspan = [0 1];
x0 = [0;0;0;0;0;0];
xf = [2;0;2;0;0;0];
[t,x] = ode45(@(t,x) droneODE(t,x,-K*(x-xf),-K*(x-xf),m1,m2,radius,height,L1,L3),tspan,x0);


% Call simulation
for k=1:length(t)
    animateDrone(x(k,:),psi,phi,theta,radius,height);
end

