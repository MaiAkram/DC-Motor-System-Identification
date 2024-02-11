%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Fuction used for "least square error" optimization          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [lse,y_est]=TF_func(alpha,y,u)
%***************************************************************
%* lse = the sum of Least Squares Errors                       *
%*       (objective function criteria for FMINSEARCH)          *
%* rt2 = coefficient of determination                          *
%*       (based on simulation response)                        *
%* y_est = Simulation Response (Transfer Function Response)    *
%***************************************************************

%********************************************
%* The function used now for evaluating is: *
%* y(k)=-a1*y(k-1)-a2*y(k-2)+b*u(k-1)       *
%* where;                                   *
%* a1 = alpha0(1)                             *
%* b = alpha0(2)                             *
% a2= alpha0(3)
%********************************************

y_est(1)=y(1);
y_est(2)=y(2);
for k=3:length(u)
    y_est(k)=-alpha(1)*y_est(k-1)- alpha(3)*y_est(k-2)+alpha(2)*u(k-1);
end

y_est=y_est';

lse=y-y_est;
lse=lse'*lse;

%lse=sum(lse.^2)