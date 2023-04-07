T = 1;
fs = 8000;
n = 0:1/fs:T;

x = sin(2*pi*2000*n) + sin(2*pi*3000*n);
N=1024;

% Freq of interest
fr=2000;
% Freq of interest in radians
wr = (fr*2/fs)*pi;


% Length of frame, 25ms
% Based on Shivam's discussion, we have to ensure that the sinc function 
% is centered around fr. Below equation might do that
frame_len = round((250/(2*fr))*fs);
% frame_len = round(2/13*fs); 

% Window definition
window = ones([1,frame_len]);

% Calculate Spectogram
% spectral = spectrogram(x, window,0,N);

number_of_window_jumps = ceil(length(x)/frame_len);
spectral = zeros([N, length(x)]);
index=1;
while index+length(window) < length(x)
    % for index = 1:number_of_window_jumps-1
    spectral(:,index) = fft(x(index:...
                            index+length(window)), ...
                            N);
    index = index + 1;
end

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

% % averaging the outputs per frame_len
% avg=zeros([1,29]);
% c=1;
% for i=1:267:length(output)-267
%     t=sum(abs(output(i:i+267)));
%     avg(c)=t;
%     c=c+1;
% end


% for i = 0:1
    subplot(2,1,1)
    plot(abs(spectral(round(N*fr/fs),:)))
    xlim([1 30])
%     hold on
%     plot(abs(spectral(round(N*fr/fs)-1,:)))
%     plot(abs(spectral(round(N*fr/fs)+1,:)))
    title("spectrogram at fr")
%     hold on
    subplot(2,1,2)      
    a = size(spectral);

%     plot(abs(output(1:frame_len:length(output))))
    plot(abs(output))
    xlim([1 30])
    title('from calc')
%     pause
% end