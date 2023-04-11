function ind=return_randindex(P)

x=rand(1,1);
if size(P,1)>size(P,2)
    P=P';
end
CP=[0 cumsum(P)];
ind=[];
for i=1:length(P)-1
    if x>=CP(i) & x<CP(i+1)
        ind=i;
        break;
    end
end

if isempty(ind)
    ind=length(P);
end