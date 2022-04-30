%% periodic noise signal.it is x2
fres = 1; fs = 8e3;
N = fs/fres; 
n = 0:N-1 ;
faxis_Hz = fs/N * (-N/2:N/2 -1);
rmsdesired = 0.1;

x = randn(1,N);
x = rmsdesired* x/rms(x);
%X = rmsdesired* X2/rms(X2);
subplot(2,1,1);stem(faxis_Hz,abs(fftshift(fft(x))));
t = n/fs ; 
subplot(2,1,2);plot(t,x);

%% aperiodic windowed with hann
Hann= hanning(2*N,'periodic');
x3 = conv(Sy19,Hann,'same');
plot(db(fft(x3)),'o')
%figure; plot(t,x3);

