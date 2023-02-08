
T = .2;
fs = 64000;
t = linspace(0.01, T, T*fs);
a = 0.01;
b = 2;
phi = 0.01;
n=2;
c= 0.01;

figure()

N = 4096; %length(t);
% fc = 1200;
for fc = 300:500:15200
    gamma_chirp  = c*log(t) ; % 0
    chirp = a * power(t, n-1) .* exp(-2*pi*b* erb(fc)*t) .* cos(2*pi*fc*t+gamma_chirp+phi);
    
    chirp_fft = fft(chirp,N);
    tf = linspace(0,fs/2, N/2);
    subplot(2,1,1)
    plot(t, chirp)
    title('Time Response')
    subplot(2,1,2)

    plot(tf, log(abs(chirp_fft(1:N/2))/max(abs(chirp_fft(1:N/2)))))
    hold on
    title('Frequency response')
%     hold off
%     pause
end
% hold off
% figure()
% subplot(2,1,1)
% plot(t, chirp)
% title('Time Response')


