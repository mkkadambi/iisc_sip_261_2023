function [Opt_S Total_LL]=estimate_stateseq(O)
% O=[4 2 2 2 1 3 4];

S_set='PBS'; %Pizza Burger Sandwitch
O_set='GHPL'; %Gloves Hat Pants Laces (gifts with dinner)

A=[.4 .3 .3;
    .2 .6 .2;
    .1 .1 .8];
P=[.3 .3 .4];
B=[.4 .2 .2 .2;
    .3 .4 .1 .1; 
    .7 .1 .1 .1];

D=ones(length(S_set),length(O))-inf;
D(:,1)=log(P'.*B(:,O(1)));
PHI=-ones(length(S_set),length(O));

for t=2:length(O)
    
    for j=1:length(S_set)
       
        temp=[];
        for i=1:length(S_set)
           
            temp(i)=log(A(i,j))+(D(i,t-1));
            
        end
        [val ind]=max(temp);
        D(j,t)=val+log(B(j,O(t)));
        PHI(j,t)=ind;
        
    end
    
end

[val ind]=max(D(:,end));
Total_LL=val;
Opt_S=ind;
for t=length(O)-1:-1:1
   
    temp1=PHI(Opt_S(1),t+1);
    Opt_S=[temp1 Opt_S];
    
end
disp(num2str(Total_LL))
disp(S_set(Opt_S))
