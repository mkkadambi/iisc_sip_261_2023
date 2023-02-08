

fs = 16000;
n = 0:1/fs:0.05;
f = 100;

x = sin(2*pi*f*n);
dx = 2*pi*f*cos(2*pi*f*n);

alt_x= x(1:2:length(x));
alt_dx = dx(2:2:length(dx));

% subplot(4,1,1)
% stem(n, x)
% title('original continuous signal')
% 
% subplot(4,1,2)
% stem(n(1:2:length(n)), alt_x)
% 
% subplot(4,1,3)
% stem(n(2:2:length(n)), alt_dx)
% 
% subplot(4,1,4)
% stem(n(1:2:length(n)), alt_x)
% hold on;
% subplot(4,1,4)
% stem(n(2:2:length(n)), alt_dx/(2*pi*f), color="red")



