%% Defining the number of simulations and the number of time points
nSimulations = 100;
n = 250;

%% Creating a storage for the results
simulationResult = zeros(n+1,nSimulations);

%% Running simulations
for i = 1:nSimulations
simulationResult(:,i) = SimulateOrnsteinUhlenbeck(500, n, 1.2, 1, 0.3, 1.2);
end

%% Ploting the results
figure();
for i = 1:nSimulations
    plot(simulationResult(:,i), 'linewidth',0.1,'Color',[0 0 0.8 0.03])
    hold on;
end
xlim([0,n])
