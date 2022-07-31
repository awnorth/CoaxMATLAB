
function dxdt = droneODE(t,x,fThrust,m1,m2,phi,radius,height,L1,L3)

% Parameters
rho = 1.225; % kg/m^3 density of the air. Using density at sea level.
C_d = 0.5; % coefficient of drag (approximated 0.5)
A = 0.3*0.09; % m^2 cross sectional area of drone
g = 9.81;
M = m1+m2;
Icm = (M/48)*(3*(radius*2)^2+4*height^2); % mass moment of intertia of solid cylinder
Igyro = 0.5;
I = Icm + Igyro;
d1 = (m2/M)*(L1+L3); % distance from m1 to drone center of mass
d2 = (m1/M)*(L1+L3); % distance from m2 to drone center of mass

% Calculate theta (measure against gyroscope) 
% calcs based on m1 & m2 aligning vertically
% psi = -x(5);
% theta = atan((sin(psi))/((L3/L1)-cos(psi)));

% Calculate phi (thrust vector)
% phi = theta + psi - pi/2;

% Drag Force = 0.5*airDensity*Cd*areaCrossSection*velocity^2
airDensity = 1.225; % kg/m^3
Cd = 0.5; % drag coefficient approximation
areaCrossSection = 0.3*0.09; % m
fDragC = 0.5*airDensity*Cd*areaCrossSection;

% Forces
fG1 = g*m1; % gravity force on mass 1
fG2 = g*m2; % gravity force on mass 2

% State Space Form
%{
x1 = x(1) = x
x2 = x(2) = xDot
x3 = x(3) = y
x4 = x(4) = yDot
x5 = x(5) = lambda
x6 = x(6) = lambdaDot
%}

dxdt(1,1) = x(2);
dxdt(2,1) = (1/M)*fThrust*cos(phi+x(5))-(1/M)*fDragC*x(2)^2;
dxdt(3,1) = x(4);
dxdt(4,1) = -(1/M)*fG1-(1/M)*fG2+(1/M)*fThrust*sin(phi+x(5))-(1/M)*fDragC*x(4)^2;
dxdt(5,1) = x(6);
% dxdt(6,1) =
% (1/I)*(-fG1*d1*sin(-x(5))+fG2*d2*sin(-x(5))-fThrust*d1*cos(phi)); % old
dxdt(6,1) = (1/I)*(-fG1*d1*sin(x(5))+fG2*d2*sin(x(5))-fThrust*d1*cos(phi+x(5)));
end