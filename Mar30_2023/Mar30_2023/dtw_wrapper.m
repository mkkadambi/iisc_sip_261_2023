x1=sin(2*pi*10*([0:141]/200).^2);
%x2=sin(2*pi*10/400*[0:199]);
% x2 = exp([0:199]);
x2 = square([0:199]/(2*pi));

stem(x1);hold on;stem(x2,'r');

localcost=zeros(length(x1),length(x2));
for i=1:length(x1)
    for j=1:length(x2)
        
        localcost(i,j)=abs(x1(i)-x2(j));
        
    end
end
disp('local cost computation done..');
[map Dist]=dtw_trial(localcost);

subplot(3,1,1)
plot(x1)
subplot(3,1,2)
plot(x2)
subplot(3,1,3)
plot(map(:,1), map(:,2))