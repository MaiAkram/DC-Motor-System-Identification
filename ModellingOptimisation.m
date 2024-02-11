%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Linear modelling using Response Error method        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

S=load('D:\UNI\Year 3\Semester 2\Dynamic Systems\Project\System_Identification - Copy.txt');
% S=load('D:\UNI\Year 3\Semester 2\Dynamic Systems\Project\Physical_ModelData.txt');
y=S(:,2);
u=S(:,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimising Parameters Using "fminsearch" function %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha0(1)=0;%1800;
alpha0(2)=0;
%alpha0(3)=0;

alphaf=fminsearch('TF_fun',alpha0,[],y,u)

[lse,y_est]=TF_fun(alphaf,y,u);

Rt2=1-cov(y-y_est)/cov(y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Creating Plots for the results  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
subplot(211)
plot(y,'ok');hold on;plot(y_est,'-k','linewidth',2)
ylabel('Response')
legend('Data points','Model estimated response')
grid on

subplot(212)
plot(u,'-k','linewidth',2)
ylabel('Input')
xlabel('Samples')
grid on