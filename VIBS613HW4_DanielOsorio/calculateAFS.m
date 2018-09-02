function afs = calculateAFS (S)
sizeS = size(S,2);
if (sizeS > 0)
    sumS = sum(S);
    tableS = tabulate(sumS);
    afs = tableS(:,2);
else
    afs = 0;
end
end