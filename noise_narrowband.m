
n = linspace(0,32000,16000);

noise =rand(size(n));
signal = audioread('C:\Users\mkkad\datasets\libri_sample\254\12312\254-12312-0003.flac'); %sin(2*pi*1000*n);
y = conv(signal, noise);


figure()
subplot(3,2,1)
plot(signal)
title('original signal')
subplot(3,2,2)
plot(y)
title('output of convolution')
subplot(3,2,3)
plot(abs(fft(signal, 1024)))
title('fft of original signal')
subplot(3,2,4)
plot(abs(fft(noise, 1024)))
title('fft of noise')
subplot(325)
    plot(abs(fft(y, 1024)))
    title('fft of convolved signal')
subplot(326)
plot(ifft(fft(y)))
title('ifft of convoloved signal')
