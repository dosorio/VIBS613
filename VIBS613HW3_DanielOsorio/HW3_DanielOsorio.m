%% Homework 2
s1 = [1 2 1 4 4 2 4 1 3 3 2 4 4 4 3 1 4 4 3 4 3 2 3 1 4 3]; 
s2 = [1 2 3 1 2 1 1 4 3 3 3 2 4 1 2 2 4 4 1 2 2 3 3 4 4 3];

X = compute_subs_matrix(s1,s2);
R = [0,.3,.4,.3;.3,0,.3,.4;.4,.3,0,.3;.3,.4,.3,0];
m = sum(R,2); 
for k=1:4
    R(k,:)=R(k,:)./m(k); 
end
freq = [.1 .2 .3 .4];
Q = composeQ(R, freq);
P = expm(Q*0.33);
LIK = sum(sum(log10(P.^X)));

%% Homework 3
[toptim, lnLmax] = fminbnd(@objfun, 0, 5, [], Q, X);
d = toptim
lnL = -lnLmax