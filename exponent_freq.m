fs = 16000;

n=0.1:1/fs:2;

% Exponential frequency rise
f = exp(n)*100;

% Decaying frequency
%f = exp(-n)*1000;

y = sin(2*pi*f);

subplot(2,1,1)
plot(f)
title('phase')

subplot(2,1,2)
plot(y)

soundsc(y)