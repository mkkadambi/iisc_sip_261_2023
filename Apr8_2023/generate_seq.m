function O=generate_seq(L)

S_set='PBS'; %Pizza Burger Sandwitch
O_set='GHPL'; %Gloves Hat Pants Laces (gifts with dinner)

A=[.4 .3 .3;
    .2 .6 .2;
    .1 .1 .8];
P=[.3 .3 .4];
B=[.4 .2 .2 .2;
    .3 .4 .1 .1; 
    .7 .1 .1 .1];

% L=20;

t=1;
q(1)=return_randindex(P);
o(1)=return_randindex(B(q(1),:));
t=t+1;
LL=log(P(q(1)))+log(B(q(1),o(1)));

while t<=L
   
    q(t)=return_randindex(A(q(t-1),:));
    LL=LL+log(A(q(t-1),q(t)));
    o(t)=return_randindex(B(q(t),:));
    LL=LL+log(B(q(t),o(t)));
    t=t+1;
    
end

disp(S_set(q))
disp(O_set(o))
disp(num2str(LL))

O=o;