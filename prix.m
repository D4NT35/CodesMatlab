theta = 0.59 ; % Paramètre t h e t a
q=3.30e-6;
K=80.5e-6;
r=0.71;
Emax=0.7*r/q;
B_0=0.5*K;
p_0=1.211;
p_1=0.0000001;
sigmap=0.06;
sigma_p= 0.3;
sigma = sigma_p;
mu = 0 ; % Paramètre mu
%sigma = 0.04 ; % Paramètre sigma
len = 100 ; % Le nombre d'itérations pour la simulation
dt = 1e-1 ; % Le pas Delta T
t = 0 : len ; % L'intervalle de nombre entiers allant de 0 jusqu'au nombre d'itérations
I = 0 : dt : len*dt ; % L'intervalle de nombres décimaux allant de 0 jusqu'à len * dt par pas dt
X = zeros(1,length(t)) ; % Initia l i s a t i o n du t a b l e a u c o n t e n a n t l e s X n
X(1) =2.6;% randn ; % X0 suit une loi normale centrée réduite
E_X0 = 0 ; % Espérance de X0
V_X0 = 1 ; % Variance de X0
Z = zeros(1,length(t));
Y = zeros(1,length(t)) ; % Initialisation du tableau contenant les Xn
Y(1) = X(1) ; % X0 suit une loi normale centrée réduite
Z(1)=Y(1);
%E_Y0 = 0 ; % Espérance de X0
%V_Y0 = 1 ; % Variance de X0
E= 0*t + p_0;

maxt=1000;
L=50;
for i=1:length(t)-1
% R e l a t i o n de r é c u r r e n c e
Z(i+1) = Z(i) + theta*(p_0-p_1*q*Emax*B_0-Z(i))*dt + sigmap*sqrt(dt)*randn ;
X(i+1) = X(i) + theta*(p_0-p_1*q*Emax*B_0-X(i))*dt + sigma_p*sqrt(dt)*randn ;
Y(i+1) = Y(i) + theta*(p_0-p_1*q*Emax*B_0-Y(i))*dt;

end

figure(1)
hold on
%subplot(2,1,1)
plot(t,X,'r',t,Y,'g',t,E,'b','LineWidth',1.125)
legend('P_t(\sigma = 0.3)','Solution \sigma = 0','Esperance')  % pour rajouter une légende 
xlabel('temps','FontSize',11)
ylabel('Prix de la recolte','FontSize',11)
title('Simulation du processus du prix de la récolte','Fontsize',12)

%subplot(2,1,2)
figure(2)
%grid 
hold on
plot(t,Z,'r',t,Y,'g',t,E,'b','LineWidth',1.125)
legend('P_t(\sigma = 0.06)','Solution \sigma = 0','Esperance')  % pour rajouter une légende 
xlabel('temps','FontSize',11)
ylabel('Prix de la recolte','FontSize',11)
title('Simulation du processus du prix de la récolte','Fontsize',12)
