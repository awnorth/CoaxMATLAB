function dx = pendcart(x,m,M,L,g,d,u)
% This function outputs the derivative of the state vectors. So 4 1st order
% ODS.

% x(1) references first element in x input matrix, so x(1) = x
% x(2) references second element in x input matrix, so x(2) = x_dot
% x(3) references third element in x input matrix, so x(3) = theta
% x(4) references fourth element in x input matrix, so x(4) = theta_dot

Sx = sin(x(3));  % Sx = sin(theta)
Cx = cos(x(3));  % Cx = cos(theta)
D = m*L*L*(M+m*(1-Cx^2));

% State Space vectors: 
% dx(1,1) = x1_dot = A*x
% dx(2,1) = x2_dot = ....
dx(1,1) = x(2);
dx(2,1) = (1/D)*(-m^2*L^2*g*Cx*Sx + m*L^2*(m*L*x(4)^2*Sx - d*x(2))) + m*L*L*(1/D)*u;
dx(3,1) = x(4);
dx(4,1) = (1/D)*((m+M)*m*g*L*Sx - m*L*Cx*(m*L*x(4)^2*Sx - d*x(2))) - m*L*Cx*(1/D)*u;

