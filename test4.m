theta = 0.59 ; % Paramètre theta
q=3.30e-6;
K=80.5e-6;
r=0.71;
Emax=0.7*r/q;
B_0=0.5*K;
p_0=1.211;
p_1=0.0000001;
sigmap=0.06;sigmapp=0.01;
sigma_p= 0.3;
sigma = sigma_p;
mu = 0 ; % Paramètre mu
%sigma = 0.04 ; % Paramètre sigma
len = 100 ; % Le nombre d'itérations pour la simulation
dt = 1e-15 ; % Le pas Delta T
t = 0 : len ; % L ' intervalle de nombre entiers allant de 0 jusqu'au nombre d'itérations
I = 0 : dt : len*dt ; % L'intervalle de nombres décimaux allant de 0 jusqu'à len*dt par pas dt
Y = zeros(1,length(t)) ; % Initialisation du tableau contenant les X n
Z = zeros(1,length(t)) ;
X = zeros(1,length(t)) ; % Initialisation du tableau contenant les Xn

Y(1) =randn ; % X0 suit une loi normale centrée réduite
X(1)=Y(1);
Z(1)=Y(1);
E_X0 = 0 ; % Espérance de X0
V_X0 = 1 ; % Variance de X0

maxt=1000;
L=50;
for j=1:length(t)-1
% Relation de récurrence
Y(j+1) = Y(j) + r*Y(j)*(1 - Y(j)/K)*dt - q*Emax*Y(j)*dt + sigma*Y(j)*sqrt(dt)*randn ;
X(j+1) = X(j) + r*X(j)*(1 - Y(j)/K)*dt - q*Emax*Y(j)*dt + sigmap*Y(j)*sqrt(dt)*randn ;
Z(j+1) = Z(j) + r*Z(j)*(1 - Z(j)/K)*dt - q*Emax*Z(j)*dt + sigmapp*Y(j)*sqrt(dt)*randn ;
end
figure(1)
hold on
plot(t,Y,'r-','Linewidth',1.125)
%plot(t,X,'g','Linewidth',1.125)
legend('B_t(\sigma = 0.3)')%,'Solution \sigma = 0','Esperance')  % pour rajouter une légende 
xlabel('temps','FontSize',11)
ylabel('Volume du stock','FontSize',11)
title('Simulation du processus du volume du stock','Fontsize',12)

figure(2)
plot(t,X,'b','Linewidth',1.125)
legend('B_t(\sigma = 0.06)')%,'Solution \sigma = 0','Esperance')  % pour rajouter une légende 
xlabel('temps','FontSize',11)
ylabel('Volume du stock','FontSize',11)
title('Simulation du processus du volume du stock','Fontsize',12)
