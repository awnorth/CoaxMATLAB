function x_sim(state,psi,phi,sigma1,theta,radius,height)
x = state(1);
x_dot = state(2);

y = 0; % no y movement yet

% ---- m1 pentagon ---- %
D1 = sqrt(radius^2+height^2);
constant_angle_1 = atan(height/radius); % long diagonal angle
constant_angle_2 = 20*pi/180; % short diagonal angle
L1 = radius/cos(constant_angle_2); % length of bottom angled segment

rotation_angle = pi/2-phi; % converts phi into amount to rotate pentagon

x1_m1 = D1*cos(constant_angle_1-rotation_angle);
y1_m1 = D1*sin(constant_angle_1-rotation_angle);
x2_m1 = L1*cos(constant_angle_2-rotation_angle);
y2_m1 = L1*sin(constant_angle_2-rotation_angle);
x3_m1 = 0; y3 = 0;
x4_m1 = -L1*cos(constant_angle_2+rotation_angle);
y4_m1 = L1*sin(constant_angle_2+rotation_angle);
x5_m1 = -D1*cos(constant_angle_1+rotation_angle);
y5_m1 = D1*sin(constant_angle_1+rotation_angle);

pent1_x_pos = [x+x1_m1 x+x2_m1 x+x3_m1 x+x4_m1 x+x5_m1 x+x1_m1];
pent1_y_pos = [y+y1_m1 y+y2_m1 y+y3 y+y4_m1 y+y5_m1 y+y1_m1];
% ------------------------------

%{
% m2
D2 = sqrt(radius^2+(4*height)^2); % diagonal distance
sigma2 = atan(radius/(4*height));

% Define m1 rectangle vertices
m2x1 = radius*cos(theta);
m2y1 = radius*sin(theta);
m2x2 = D2*sin(sigma2+theta);
m2y2 = -D2*cos(sigma2+theta);
m2x3 = -D2*sin(sigma2-theta);
m2y3 = -D2*cos(sigma2-theta);
m2x4 = -radius*cos(theta);
m2y4 = -radius*sin(theta);
m2_x_pos = [x+m2x1 x+m2x2 x+m2x3 x+m2x4 x+m2x1];
m2_y_pos = [y+m2y1 y+m2y2 y+m2y3 y+m2y4 y+m2y1];
%}

% ---------- pentagon 2
D2 = sqrt(radius^2+(2*height)^2);
L2 = radius/cos(constant_angle_2);
constant_angle_3 = atan((2*height)/radius);

x1_m2 = 0; y1_m2 = 0;
x2_m2 = L2*cos(constant_angle_2-theta);
y2_m2 = -L2*sin(constant_angle_2-theta);
x3_m2 = D2*cos(constant_angle_3-theta);
y3_m2 = -D2*sin(constant_angle_3-theta);
x4_m2 = -D2*cos(constant_angle_3+theta);
y4_m2 = -D2*sin(constant_angle_3+theta);
x5_m2 = -L2*cos(constant_angle_2+theta);
y5_m2 = -L2*sin(constant_angle_2+theta);

pent2_x_pos = [x+x1_m2 x+x2_m2 x+x3_m2 x+x4_m2 x+x5_m2 x+x1_m2];
pent2_y_pos = [y+y1_m2 y+y2_m2 y+y3_m2 y+y4_m2 y+y5_m2 y+y1_m2];
% ----------------


plot(pent1_x_pos,pent1_y_pos,'color','red',LineWidth=2), hold on
% plot(m2_x_pos,m2_y_pos,'Color','red',LineWidth=2)
plot(pent2_x_pos,pent2_y_pos,'Color','red',LineWidth=2)


axis([-4 4 -3 2]);, axis equal
xlabel('meters');
set(gcf,'Position',[100 100 1000 400])
drawnow, hold off