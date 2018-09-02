function thetaPI = calculateThetaPI(S)
d = 0;
for i = 1:size(S,1)
    for j = 1:size(S,1)
        if i < j
            d = (d + sum(S(i,:) ~= S(j,:)));
        end
    end
end
thetaPI = ((factorial(size(S,1))/(factorial(2)*factorial((size(S,1)-2))))^-1)*d;
end