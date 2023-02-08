T = 3;
fs = 16000;
t = linspace(0, T, f);
y = sin(2*pi*1000*t);


for n = 0.1:.25/fs:T*fs:
    Y = fft(y, 1024);
    freqz(Y, 1024)
    pause
end



