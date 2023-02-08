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


y = sin(phase);

figure()
subplot(2,1,1)
plot(y)
subplot(2,1,2)
plot(phase)
title('phase')

figure()
freqz(y)

soundsc(y, fs)