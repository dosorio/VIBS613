function thetaS = calculateThetaS(S)
thetaS = size(S,2)/sum(1./(1:(size(S,1)-1)));
end