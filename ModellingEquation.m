%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Linear modelling using Equation Error method        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

% S=load('D:\UNI\Year 3\Semester 2\Dynamic Systems\Project\System_Identification.txt');
S=load('D:\UNI\Year 3\Semester 2\Dynamic Systems\Project\Physical_ModelData.txt');

y=S(:,2);
u=S(:,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Calculating TF Parameters using Equation Error   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assuming a zero initial condition for input and output
u(2:length(u)+1)=u; u(1)=0;
y(2:length(y)+1)=y; y(1)=0;

%Calculating Left Hand Side matrix elements
LHS(1,1)=sum(y(1:length(y)-1).*y(1:length(y)-1));
LHS(1,2)=sum(y(1:length(y)-2).*y(2:length(y)-1));
LHS(1,3)=-sum(u(1:length(u)-1).*y(1:length(y)-1));

LHS(2,1)=LHS(1,2);
LHS(2,2)=sum(y(1:length(y)-2).*y(1:length(y)-2));
LHS(2,3)=-sum(u(2:length(u)-1).*y(1:length(y)-2));

LHS(3,1)=LHS(1,3);
LHS(3,2)=LHS(2,3);
LHS(3,3)=sum(u(1:length(u)-1).^2);

%Calculating Right Hand Side matrix elements
RHS(1,1)=-sum(y(2:length(y)).*y(1:length(y)-1));
RHS(2,1)=-sum(y(3:length(y)).*y(1:length(y)-2));
RHS(3,1)=sum(y(2:length(y)).*u(1:length(u)-1));

%Solution of simultaneous equations
X=LHS\RHS;
b0=X(1)
b1=X(2)
a=X(3)
