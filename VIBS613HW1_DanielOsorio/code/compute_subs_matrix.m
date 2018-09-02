function [X] = compute_subs_matrix(s1,s2)
    X = zeros(4,4);
    for position = 1:size(s1,2)
        X(s2(position),s1(position)) = (X(s2(position),s1(position))+1);
    end 
end
