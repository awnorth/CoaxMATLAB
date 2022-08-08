
L1 = 0.05; %m
L3 = 0.1; %m

% psi = pi;
% psiDegree = psi*180/pi;
% 
% lambda = -psi-atan(sin(psi)/((L3/L1)-cos(psi)));
% lambdaDegree = lambda*180/pi;

for i = 0:20
    psiDegree = 180-i;
    psi = psiDegree*pi/180;

    lambda = -psi-atan(sin(psi)/((L3/L1)-cos(psi)))-pi;
    lambdaDegree = lambda*180/pi;

    ANS(i+1,:) = [psiDegree,lambdaDegree+360]
end