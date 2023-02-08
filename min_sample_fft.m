fs = 16000;
f = 50;

n=0:1/fs:.01;
y = sin(2*pi*f*n);
    
for i = 20:10:71 
    x = y(1:i);
    X = fft(x);
    
    disp(i)
    subplot(3,1,1)
    plot(n(1:i),x)
    title(strcat('n=',num2str(length(i))))
    
    subplot(3,1,2)
    plot(20*log10(abs(X)))
    title('FFT')
    
    subplot(3,1,3)
    plot(phasez(X))
    title('phase')
    pause()
end

