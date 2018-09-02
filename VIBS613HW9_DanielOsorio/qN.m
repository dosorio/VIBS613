function [qN] = qN(x)
%% Creating required matrices
index = repmat(1:size(x,1),size(x,2),1)';
qN = zeros(size(x));

%% Ordering
for c = 1:size(x,2)
for i = 1:size(x,1)
    for j = (i+1):size(x,1)
        if x(i,c) > x(j,c)
        temp = x(i,c);
        x(i,c) = x(j,c);
        x(j,c) = temp;
        temp = index(i,c);
        index(i,c) = index(j,c);
        index(j,c) = temp;
        end
    end
end
end

%% Averaging
meanV = round(mean(x'));
for i = 1:size(x,1)
    for j = 1:size(x,2)
        x(i,j) = meanV(i);
    end
end

%% Re-ordering
for i = 1:size(x,1)
    for j = 1:size(x,2)
        qN(index(i,j),j) = x(i,j);
    end
end
end