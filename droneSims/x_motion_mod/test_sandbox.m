% Test Sandbox

R = 0.4; % m
H = 1; % m
D1 = sqrt(R^2+H^2);
constant_angle_1 = atan(H/R); % long diagonal angle
constant_angle_2 = 20*pi/180; 
L = R/cos(constant_angle_2); % length of bottom angled segment

phi=pi/2-20*pi/180; % input into function
phi_degree = phi*180/pi;
rotation_angle = pi/2-phi;

x1 = D1*cos(constant_angle_1-rotation_angle);
y1 = D1*sin(constant_angle_1-rotation_angle);
x2 = L*cos(constant_angle_2-rotation_angle);
y2 = L*sin(constant_angle_2-rotation_angle);
x3 = 0; y3 = 0;
x4 = -L*cos(constant_angle_2+rotation_angle);
y4 = L*sin(constant_angle_2+rotation_angle);
x5 = -D1*cos(constant_angle_1+rotation_angle);
y5 = D1*sin(constant_angle_1+rotation_angle);

x_pos = [x1 x2 x3 x4 x5 x1];
y_pos = [y1 y2 y3 y4 y5 y1];

plot(x_pos,y_pos)
axis([-2 2 -2 2]);