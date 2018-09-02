function [dXt] = SimulateOrnsteinUhlenbeck(T, n, theta, alpha, sigma, x0)
rng('shuffle')
dW = normrnd(0, sqrt(T / n), [1, n]);
dt = (T / n);
dXt = x0;
for i = 2:(n + 1);
dXt = [dXt, dXt(i - 1) + alpha * (theta - dXt(i - 1)) * dt + sigma * dW(i - 1)];
end
end