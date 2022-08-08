function animateDrone(state,psi,phi,theta,radius,height)
x = state(1);
y = state(3);
lambda = state(5); % note lambda is negative as drone rotates clockwise
radius = 0.04; % m
height = 0.1; % m
% ---- m1 pentagon ---- %
D1 = sqrt(radius^2+height^2);
constant_angle_1 = atan(height/radius); % long diagonal angle
constant_angle_2 = 20*pi/180; % short diagonal angle
L1 = radius/cos(constant_angle_2); % length of bottom angled segment

rotation_angle = pi/2-phi; % converts phi into amount to rotate pentagon

x1_m1 = D1*cos(constant_angle_1-rotation_angle+lambda);
y1_m1 = D1*sin(constant_angle_1-rotation_angle+lambda);
x2_m1 = L1*cos(constant_angle_2-rotation_angle+lambda);
y2_m1 = L1*sin(constant_angle_2-rotation_angle+lambda);
x3_m1 = 0; y3 = 0;
x4_m1 = -L1*cos(constant_angle_2+rotation_angle-lambda);
y4_m1 = L1*sin(constant_angle_2+rotation_angle-lambda);
x5_m1 = -D1*cos(constant_angle_1+rotation_angle-lambda);
y5_m1 = D1*sin(constant_angle_1+rotation_angle-lambda);

pent1_x_pos = [x+x1_m1 x+x2_m1 x+x3_m1 x+x4_m1 x+x5_m1 x+x1_m1];
pent1_y_pos = [y+y1_m1+3*height y+y2_m1+3*height y+y3+3*height y+y4_m1+3*height y+y5_m1+3*height y+y1_m1+3*height];

% ---------- pentagon 2
D2 = sqrt(radius^2+(2*height)^2);
L2 = radius/cos(constant_angle_2);
constant_angle_3 = atan((2*height)/radius);

x1_m2 = 0; y1_m2 = 0;
x2_m2 = L2*cos(constant_angle_2-theta-lambda);
y2_m2 = -L2*sin(constant_angle_2-theta-lambda);
x3_m2 = D2*cos(constant_angle_3-theta-lambda);
y3_m2 = -D2*sin(constant_angle_3-theta-lambda);
x4_m2 = -D2*cos(constant_angle_3+theta+lambda);
y4_m2 = -D2*sin(constant_angle_3+theta+lambda);
x5_m2 = -L2*cos(constant_angle_2+theta+lambda);
y5_m2 = -L2*sin(constant_angle_2+theta+lambda);

pent2_x_pos = [x+x1_m2 x+x2_m2 x+x3_m2 x+x4_m2 x+x5_m2 x+x1_m2];
pent2_y_pos = [y+y1_m2+3*height y+y2_m2+3*height y+y3_m2+3*height y+y4_m2+3*height y+y5_m2+3*height y+y1_m2+3*height];
% ----------------


plot(pent1_x_pos,pent1_y_pos,'color','red',LineWidth=2), hold on
% plot(m2_x_pos,m2_y_pos,'Color','red',LineWidth=2)
plot(pent2_x_pos,pent2_y_pos,'Color','red',LineWidth=2)


axis([-.5 2 0 5]);, axis equal % sets simulation screen dimensions x x y y 
xlabel('meters');
ylabel('meters');
set(gcf,'Position',[100 100 1000 400]) % sets size of simulation screen on page
drawnow, hold off