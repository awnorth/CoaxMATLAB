function dxdt = droneODE(t,x,U,m1,m2,radius,height,L1,L3)
% k = 4E-2; % F_thrust = k*(motor angular veloctiy)
% fThrust = U1(1)*k; % Input 1, thrust force
fThrust = U(1); % Input 1, thrust force
psi = U(2); % Input 2, servo angle psi

% Parameters
airDensity = 1.225; % kg/m^3 density of the air. Using density at sea level.
drag1 = 0.5; % coefficient of drag (approximated 0.5)
A = 0.3*0.09; % m^2 cross sectional area of drone
drag2 = 0.5*airDensity*drag1*A; % second coefficient of drag to simplify below eqns 
g = 9.81;
M = m1+m2;
Icm = (M/48)*(3*(radius*2)^2+4*height^2); % mass moment of intertia of solid cylinder
Igyro = 0.5;
I = Icm + Igyro;
d1 = (m2/M)*(L1+L3); % distance from m1 to drone center of mass
d2 = (m1/M)*(L1+L3); % distance from m2 to drone center of mass

% Calculate theta (measure against gyroscope) 
% calcs based on m1 & m2 aligning vertically
theta = atan((sin(psi))/((L3/L1)-cos(psi)));

% Calculate phi (thrust vector)
phi = theta + psi - pi/2 + x(5);

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
dxdt(2,1) = (1/M)*fThrust*cos(phi)-(1/M)*fDragC*x(2)^2;
dxdt(3,1) = x(4);
dxdt(4,1) = -(1/M)*fG1-(1/M)*fG2+(1/M)*fThrust*sin(phi)-(1/M)*fDragC*x(4)^2;
dxdt(5,1) = x(6);
% dxdt(6,1) =
% (1/I)*(-fG1*d1*sin(-x(5))+fG2*d2*sin(-x(5))-fThrust*d1*cos(phi)); % old
dxdt(6,1) = (1/I)*(-fG1*d1*sin(x(5))+fG2*d2*sin(x(5))-fThrust*d1*cos(phi));
end