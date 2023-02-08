fs = 16000;
n = 0:1/fs:2;

f= 200;

number_of_waves = ceil(fs/f);
phase = zeros([1,length(n)]);
for i = 1:length(n)
    if i<1000
        phase(i)= 2*pi*f*n(i);
    elseif i<4000
        phase(i)= 2*pi*(f+5)*n(i);
    elseif i<8000
        phase(i) = 2*pi*(f-5)*n(i);
    elseif i<12000
        phase(i) = 2*pi*f*n(i)*(i-1200);
    else
        phase(i)= 2*pi*f*randn(1)*n(i);
    end
end


x = sin(phase);

% n=0:1:999;
a = 0.99; 
% x = power(a, n);
m = round(fs*20e-3);
h = ones([1, m]);
N = 1024;

number_of_windows = floor(length(n)/m);
X = zeros([number_of_windows,N]);
for i = 1:number_of_windows
    X(i,:) = fft(x, N); 

end
% figure
% hold on
% for i = 1:number_of_windows
%     plot(abs(X(i,:)))
%     pause 
% end

x_plane, y_plane = meshgrid(1:number_of_windows, 1:N);
surf(x_plane, y_plane, abs(X));
