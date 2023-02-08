
fs = 16000;
n = .1:1/fs:2;
f = 5000;
f2 = 5000;

phase = 2*pi*f*n;
phase_2 = 2*pi*f2*n;
sinc_1 = zeros([length(n),1]);
sinc_2 = zeros([length(n),1]);

for i = 1:length(n)
    sinc_1(i) = sin(phase(i)); %/(phase(i));

    sinc_2(i) = sinc(phase_2(i)); %/(phase_2(i));
end

sinc_3 = sinc_1 .* sinc_2;

subplot(3,1,1)
plot(sinc_1)
title('sinc 1')

subplot(3,1,2)
plot(sinc_2)
title('sinc 2')

subplot(3,1,3)
plot(sinc_3)
title('sinc product')