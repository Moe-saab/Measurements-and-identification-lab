%% Author : Mohamad Saab

%% Task 0.6.1
N = 1000;
n = 0:N-1;
x = randn(1,N);
X = fftshift(fft(x,N));
subplot(1,3,1);plot(n,x);
faxis_bins = -N/2:N/2 -1;
subplot(1,3,2);stem(faxis_bins,abs(X));
subplot(1,3,3);stem(faxis_bins,angle(X));

%% Task 0.6.2
N = 1000;
n = 0:N-1;
fs = 100; Ts = 1/fs;
order = 5;
ripple = 2;
fc = 5;
x = randn(1,N);
t = n*Ts;
subplot(2,2,1);plot(t,x);title('before filtering');xlabel('sec');
faxis_Hz = fs/N * (-N/2:N/2 -1);
subplot(2,2,2);stem(faxis_Hz,abs(fftshift(fft(x))));title('amplitude spectrum before filtering');xlabel('Hz');
wp = fc/(0.5*fs);
[B,A] = cheby1(order,ripple,wp);
xfiltered = filter(B,A,x);
subplot(2,2,3);plot(t,xfiltered);title('after filtering');xlabel('sec');
subplot(2,2,4);stem(faxis_Hz,abs(fftshift(fft(xfiltered))));title('spectrum after filtering')';xlabel('Hz');

%% Task 0.6.3
N = 1000; n = 0:N-1 ;fs = 100; t = n/fs ; faxis_Hz = fs/N * (-N/2:N/2 -1);
x = randn(1,N); X = 1/N * fftshift(fft(x,N));
X2 = zeros(size(X));
fp = (faxis_Hz<=5 & faxis_Hz>=-5);
X2(fp) = X(fp); 
figure; hold on;
stem(faxis_Hz,abs(X));
stem(faxis_Hz,abs(X2));
x2 = N*(ifft(ifftshift(X2)));
figure;hold on;plot(t,x);plot(t,x2);



%% Task 0.7.1
RMSdes = 3;
xdes = x*RMSdes / rms(x);
x2des = x2*RMSdes / rms(x2);
figure; hold on;
plot(t,xdes,t,x2des);






