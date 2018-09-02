function [B,Q] = bqWall(S)
SS = size(S,2);
adjacentSS = SS-1;
betaPrime = 0;
partitionProfiles = [];
for site = 1:adjacentSS
    if all((S(:,site) == S(1,site)) ==  (S(:,site+1) == S(1,site+1)))
        partitionProfiles = [partitionProfiles,(S(:,site) == S(1,site))];
        betaPrime = betaPrime + 1;
    end
end
A = unique(partitionProfiles','rows');
B = betaPrime/adjacentSS;
Q = (betaPrime + size(A,1))/SS;
end