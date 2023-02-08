%
% Guitar Chord Frequencies
% A = 110Hz
% D = 146.83Hz
% E = 82.41Hz
% G = 196Hz
%
fs = 16000;
T = 2;
t = linspace(0,T,T*fs);
f0 = 196;
y = sin(2*pi*f0*t);
% 1000, 2000, 3000, 4000: 500 x3, 1500, 2000, 2500 x 2, 3000, 3500
% 2000, 3000, 4000:       500 x2,             2500,     3000, 3500

% 100, 200, 300, 400: 50 x 3, 150, 200, 250 x 2, 300, 350, 
% 200, 300, 400:      50 x 2,           250,     300, 350, 
subplot(3,1,1)
plot(y)
title('Fundamental frequency F0')

soundsc(y, fs)
subplot(3,1,2)
y_multiple = normalize(sin(2*pi*f0*t) + sin(2*(2*pi*f0*t)) ...
            + sin(3*(2*pi*f0*t)) + sin(4*(2*pi*f0*t)) + sin(5*(2*pi*f0*t)));
y_multiple= y_multiple/max(abs(y_multiple));
soundsc(y_multiple, fs)

plot(y_multiple);
title('All 3 Frequencies')

subplot(3,1,3)
y_missing =  sin(2*2*pi*f0*t) + sin(3*2*pi*f0*t) ...
            + sin(4*(2*pi*f0*t)) ...
            + sin(5*(2*pi*f0*t));
y_missing = y_missing/max(abs(y_missing));
soundsc(y_missing, fs)
plot(y_missing);
title('Missing F0')


fft_y_missing = abs(fft(y_missing,fs));
fft_y_multiple = abs(fft(y_multiple, fs));
figure()
subplot(2,1,1)
plot(fft_y_multiple);
title('All 3 Frequencies')

subplot(2,1,2)
plot(fft_y_missing)
title('Missing F0')

