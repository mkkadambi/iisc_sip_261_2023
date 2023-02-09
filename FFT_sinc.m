clc; clear all;

T = 1;
fs = 16000;
n = 0:1/fs: T;
N = 14e-3;
y = sin(2*pi*n/N);

fprintf("Periodicty after sampling = %f", N*fs)
% % % Observations
% % If sinusoid is 100, 200, 110, 105, then we get impulse in freq
% % domain even for N<fs
% % For any other freq, we get impulse at N=fs
% % For all frequencies we dont get impulses at N>fs

for Nf = [100, 128, 150, 200, 300, 256, 480, 555, 600,800, 960, 1200, 1400, length(y)-1] %round(.1*fs):round(.1*fs):(3*fs)
    Y = fft(y, Nf);
    subplot(2,1,1)
    stem(abs(Y(1:round(length(Y)/2))))
    title(Nf)
    subplot(2,1,2)
    stem(n,y)
    pause
end


% for Nf = round(.1*fs):round(.1*fs):(3*fs)
%     freqz(y,Nf);
%    title(Nf)
%     pause
% end
