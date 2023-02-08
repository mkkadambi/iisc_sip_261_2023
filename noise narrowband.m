
n = linspace(0,32000,16000);
noise = rand(size(n));
signal = sin(2*pi*1000*n);
y = conv(signal, noise);


figure()
subplot(3,1,1)
plot(y)
title('signal output')
subplot(3,1,2)
plot(abs(fft(y, 1024)))
title('fft')