%% multisine with random phase and excitation in analysis band only
fs = 8e3;
f1 = 1; f2 = 500;
fres = 1;
N = fs/fres; 
m = f1:f2; k = abs(f1-f2);
phirandom = 2*pi*rand(k+1,1);
Ak = ones(k+1,1);
X = zeros(N,1);
X(f1+1:fres:f2+1) = Ak.*exp(1j*phirandom);

rmsdesired = 0.1;
%X = rmsdesired* X/rms(X);


faxis_Hz = fres * (0:1:N-1);
subplot(1,2,1);stem(faxis_Hz,abs(X));
title('spectrum of multisine with random phase');xlabel('Hz');

x = N * real(ifft(X));
x = rmsdesired* x/rms(x);
n = 0:N-1; Ts = 1/fs ;t = n*Ts;
subplot(1,2,2);plot(t,x);
title('time domain of multisine with random phase');xlabel('sec');