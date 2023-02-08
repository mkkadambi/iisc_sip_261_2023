fs = 16000;

a = 0.2;
b = 1;
phi = 0.01;
c= 0.01;

n=0.1:1/fs:2;
f1_a = 818;
f2_a = 1182;

f1_e = 292;
f2_e = 2352;
fc = 80;



% % % f1_a_log = log(f1_a);
% % % f2_a_log = log(f2_a);
% % % f1_e_log = log(f1_e);
% % % f2_e_log = log(f2_e);
% % % 
% % % f1 = exp(linspace(f1_a_log,f1_e_log, length(n)));
% % % f2 = exp(linspace(f2_a_log,f2_e_log, length(n)));
% % % 
% % % yp = sin(2*pi*fp*n);
% % % y1 = 0.25*sin(2*pi*f1.*n);
% % % y2 = 0.25*sin(2*pi*f2.*n);
% % % 
% % % y = yp+ y1+y2;
% % % 
% % % subplot(2,1,1)
% % % plot(f1)
% % % hold on
% % % plot(f2)
% % % hold off
% % % subplot(2,1,2)
% % % plot(y)
% % % 
% % % soundsc(y, fs)

% % p = roots([1 0.01 1]);
% % k = 1;
% % z = [0 0]';
% % p = [cos(2*pi*f1_e) + 1i*sin(2*pi*f1_e), ...
% %     cos(2*pi*f1_e) - 1i*sin(2*pi*f1_e), ...
% %     cos(2*pi*f2_e) + 1i*sin(2*pi*f2_e), ...
% %     cos(2*pi*f2_e) - 1i*sin(2*pi*f2_e)];

% [b,a] = zp2tf(z,p,k);
% [h, t] = impz(b,a);

f1_e_bp = designfilt('bandpassfir','FilterOrder',60, ...
         'CutoffFrequency1',f1_e-0.05*f1_e,'CutoffFrequency2',f1_e+0.010*f1_e, ...
         'SampleRate',fs);

f2_e_bp = designfilt('bandpassfir','FilterOrder',60, ...
         'CutoffFrequency1',f2_e-0.05*f2_e,'CutoffFrequency2',f2_e+0.01*f2_e, ...
         'SampleRate',fs);


f1_a_bp = designfilt('bandpassfir','FilterOrder',60, ...
         'CutoffFrequency1',f1_a-0.05*f1_a,'CutoffFrequency2',f1_a+0.010*f1_a, ...
         'SampleRate',fs);

f2_a_bp = designfilt('bandpassfir','FilterOrder',60, ...
         'CutoffFrequency1',f2_a-0.05*f2_a,'CutoffFrequency2', ...
         f2_a+0.01*f2_a, ...
         'SampleRate',fs);


% [noise, Fs] = audioread('C:\Users\mkkad\datasets\noise_audios\white_16k.wav');

gamma_chirp  = c*log(n) ; % 0
chirp = a * power(n, 2-1) .* exp(-2*pi*b* erb(fc)*n) .* cos(2*pi*fc*n+gamma_chirp+phi);

imp_train = zeros(size(n));
imp_train(1:round(fs/fc):length(n))=1;
y1 = conv(chirp,imp_train);
% y1 = rand([32000,1]);

f1_e_y = filter(f1_e_bp,y1);
f2_e_y = filter(f2_e_bp,y1);

f1_a_y = filter(f1_a_bp,y1);
f2_a_y = filter(f2_a_bp,y1);


y_e = f1_e_y + f2_e_y;
y_a = f1_a_y + f2_a_y;

y_ae = y_e + y_a;

% sound_a = conv(noise, h);
% sound_e = conv(noise, h);

