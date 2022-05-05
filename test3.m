function Jump
%Function that simulates a stochastic process with jumps
%Initial parameters
X0=100;
mu=0.05;
Div=0.00;
Lambda= 3;
sigma=0.3;
muJ=0.02;
sigmaJ=0.10;
T=1;
NbPas=200;
NbStep=250; %Number of steps per year
DeltaT=1/NbStep;
NbDays=T*NbStep;
k=exp(-muJ)-1;
%Simulation of Poisson and Gaussian random variables
PoissonG=poissrnd(Lambda/NbPas,1,NbDays);
DeltaZ=randn(1,NbDays);
PoissonJumps=zeros(1,NbDays);
%Determination of jumps for the Poisson process
for i=1:NbDays
PoissonJumpss(1,i)=sum(randn(PoissonG(1,i),1));
end
%Constructing the increments
IncrementsJumps=(mu-Div-Lambda*k-0.5*sigma^2)*DeltaT*...
ones(1,NbDays)+sigma*sqrt(DeltaT)*DeltaZ+...
(muJ-0.5*sigmaJ^2)*PoissonG+sigmaJ*...
PoissonJumps;
Increments=(mu-Div-0.5*sigma^2)*DeltaT*ones(1,NbDays)+...
sigma*sqrt(DeltaT)*DeltaZ;
SolJumps=exp(cumsum([log(X0),IncrementsJumps],2));
Sol=exp(cumsum([log(X0),Increments],2));
%Graph of the trajectories with and without jumps
figure
hold on
plot(0:1:NbDays,SolJumps,0:1:NbDays,Sol);
legend('With jumps','Without jump');
hold off
end