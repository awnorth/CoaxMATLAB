% function [dydt] = diffeqn(t,y)
% %     dydt(1) = y(2);
% %     dydt(2) = (1-y(1)^2)*y(2) - y(1);
% %     dydt = dydt';
% 
% %     dydt = [y(2); (1-y(1)^2)*y(2)-y(1)];
% g = 9.81;
% L = 1;
% dydt = [y(2); -(g/L)*sin(y(1))];
% end

function [dydt] = diffeqn(t,y)
%     dydt(1) = y(2);
%     dydt(2) = (1-y(1)^2)*y(2) - y(1);
%     dydt = dydt';

%     dydt = [y(2); (1-y(1)^2)*y(2)-y(1)];
g = 9.81;
L = 1;
a = 0.4; % air resistance
dydt = [y(2); -(g/L)*sin(y(1))-(a/L^2)*y(2)];
end
