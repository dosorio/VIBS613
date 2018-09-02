function lnL = objfun(t,Q,X)
P = expm(Q*t);
lnL = -sum(sum(log10(P.^X)));
end