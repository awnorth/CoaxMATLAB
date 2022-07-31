% Test Sandbox 2
 
R = 0.4; % m
H = 0.5; % m
D = sqrt(R^2+H^2);

for i=1:360

psi = i*pi/180; % rotation angle
theta = atan(H/R);

x1 = D*cos(theta+psi);
y1 = D*sin(theta+psi);
x2 = D*cos(pi-theta+psi);
y2 = D*sin(pi-theta+psi);
x3 = D*cos(pi+theta+psi);
y3 = D*sin(pi+theta+psi);
x4 = D*cos(-theta+psi);
y4 = D*sin(-theta+psi);
x5 = D*cos(theta+psi);
y5 = D*sin(theta+psi);

x_pos = [x1 x2 x3 x4 x5];
y_pos = [y1 y2 y3 y4 y5];

plot(x_pos,y_pos), hold on
axis([-2 2 -2 2]);
drawnow, hold off
end