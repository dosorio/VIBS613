%% Functions Download
%   websave('ms_mex.mexw64','https://github.com/jamesjcai/PGEToolbox/raw/master/ms_mex.mexw64');
%   websave('ms_mex.mexw32','https://github.com/jamesjcai/PGEToolbox/raw/master/ms_mex.mexw32');
%   websave('ms_mex.mexa64','https://github.com/jamesjcai/PGEToolbox/raw/master/ms_mex.mexa64');
%   websave('ms_mex.mexmaci64','https://github.com/jamesjcai/PGEToolbox/raw/master/ms_mex.mexmaci64');

%% Generation of S
[S] = ms_mex(10,4.0)

%% AFS generation
AFS = calculateAFS(S)

%% Theta S
ThetaS = calculateThetaS(S)

%% Theta pi
thetaPI = calculateThetaPI(S)

%% 1000 times Simulation
thetaS = zeros(1,1000);
thetaPI = zeros(1,1000);

for simulation = 1:1000
    %% Generation of S
    [S] = ms_mex(10,4.0);
    
    %% AFS generation
    calculateAFS(S);
    
    %% Theta S
    thetaS(simulation) = calculateThetaS(S);
    
    %% Theta pi
    thetaPI(simulation) = calculateThetaPI(S);
end

%% Ploting the distribution
thetaDistribution = thetaPI - thetaS;
histogram(thetaDistribution);