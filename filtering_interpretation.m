T = 1;
fs = 8000;
n = 0:1/fs:T;

x = sin(2*pi*0*n) + sin(2*pi*3000*n);
N=1024;

% Freq of interest
fr=3000;
% Freq of interest in radians
wr = (fr*2/fs)*pi;


% Length of frame, 25ms
frame_len = round((200/(2*fr))*fs);
% frame_len = round(2/13*fs); 

% Window definition
window = ones([1,frame_len]);

% Calculate Spectogram
s = spectrogram(x, window,0,N, fs);

exponent = exp(1i*wr*n);

% Multiple h[n]exp(i*w_r*n)
h = exponent(1:frame_len) .* window;

% Convolve x[n] with h[n]exp(i*w_r*n)
x_dash = conv(h,x);

% Since x_dash will be longer than x, calculating n for this range
% (length of x_dash corresponds to a time T1 for the sampling freq fs)
n = 0:1/fs:ceil(length(x_dash)/fs);
n = n(1:length(x_dash));

% 
exponent_2 = exp(-1i*wr*n);
% Multiplying e(-iwrn) and conv(x[n], h[n]exp(i*w_r*n))
output = exponent_2.*x_dash;

for i = 0:1
    subplot(2,1,1)
    plot(abs(s(round(N*fr/fs),:)))
%     hold on
%     plot(abs(s(round(N*fr/fs)-1,:)))
%     plot(abs(s(round(N*fr/fs)+1,:)))
    title(i)
%     hold on
    subplot(2,1,2)
    a = size(s);
    plot(abs(output(a(2):2*a(2))))
    title('from calc')
%     pause
end