fs = 48000;
T = 2*fs;
t = linspace(1,2, T);
f = 1000;
y = sin(2*pi*f*t);

% y_fft = fft(y,fs);
% 
% rand_fft = rand(size(y_fft), 'like', y_fft);
% y_rand_fft = y_fft + rand_fft;
% 
% y_ifft = ifft(y_rand_fft, T);
% y_ifft = real(y_ifft)/max(abs(y_ifft));
% 
% rand_time = rand(size(y_ifft), 'like', y_ifft);
% y_rand_time = y_ifft + rand_time;
% y_final_fft = fft(y_rand_time, fs);
% 
% figure()
% subplot(3,2,1)
% plot(t,y)
% title('Original Signal')
% subplot(3,2,2)
% plot(abs(y_fft))
% title('FFT of original signal')
% subplot(3,2,3)
% plot(abs(y_rand_fft))
% title('Jittered FFT')
% subplot(3,2,4)
% plot(t,y_ifft)
% title('Freq jittered signal')
% subplot(3,2,5)
% plot(t,y_rand_time)
% title('Freq + time jitter')
% subplot(3,2,6)
% plot(abs(y_final_fft))
% title('FFT of Freq + time jitter')
% soundsc(y_rand_time,fs)


number_of_waves = 2000;
signal=[];
deltas = [];
for i = 1:number_of_waves
    f_new = f + 3*(randi([-10, 10])); %rand(1)*10;
    n = linspace(0,1/f_new,fs/f_new);
    signal = cat(2,signal, sin(2*pi*f_new*n));
    
end
subplot(2,1,1)
    plot(signal)
    subplot(2,1,2)
    N = power(2, nextpow2(fs/2));
    f = 1:N/2+1;
    tf = linspace(0,round(fs/2),N/2+1);
    FFT = abs(fft(signal, N));
    plot(tf, FFT(1:N/2+1))
% figure()
% subplot(3,2,1)
% plot(t,y)
% title('Original Signal')
% subplot(3,2,2)
% plot(abs(y_fft))
% title('FFT of original signal')
% subplot(3,2,3)
% plot(abs(y_rand_fft))
% title('Jittered FFT')
% subplot(3,2,4)
% plot(t,y_ifft)
% title('Freq jittered signal')
% subplot(3,2,5)
% plot(t,y_rand_time)
% title('Freq + time jitter')
% subplot(3,2,6)
% plot(abs(y_final_fft))
% title('FFT of Freq + time jitter')
% soundsc(y_rand_time,fs)
