function dTHdt = holeTableODE(t,theta,c,r0,thetaDot0)
    dTHdt = (r0/(r0-c*t))^2*thetaDot0;
%     distance = c*t;
end