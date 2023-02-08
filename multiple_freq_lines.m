fs = 16000;

n=0.1:1/fs:2;

% Exponential frequency rise
f1 = exp(n)*100;

% Decaying frequency
f2 = exp(-n)*1000;

y = sin(2*pi*f1) + sin(2*pi*f2);

subplot(2,1,1)
plot(f1)
hold on
plot(f2)
hold off
title('phase')

subplot(2,1,2)
plot(y)

soundsc(y)