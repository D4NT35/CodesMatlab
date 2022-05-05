randn('state',100)
T = 1; N = 500; dt = T/N;
dW = zeros(1,N);
W = zeros(1,N); % set the state of randn
dW(1) = sqrt(dt)*randn;
W(1) = dW(1);
for j = 2:N
dW(j) = sqrt(dt)*randn;
W(j) = W(j-1) + dW(j);
end % first approximation outside the loop ...
% since W(0) = 0 is not allowed
% preallocate arrays ...
% for efficiency
% general increment
plot([0:dt:T],[0,W],'r-')
% plot W against t
xlabel('t','FontSize',16)
ylabel('W(t)','FontSize',16,'Rotation',0)