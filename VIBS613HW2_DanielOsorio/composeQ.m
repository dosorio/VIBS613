function [Q] = composeQ(R,freq)
    PI = diag(freq);
    Q = R*PI;
    Q = Q + diag(-1*sum(Q,2));
    Q= (Q./abs(trace(Q)))*size(Q,1);
end