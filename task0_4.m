%% Author : Mohamad Saab

%% Task 0.4.2
N = 1000;
k = 30;
Ak = ones(k,1);
phi = 2*pi*rand(k,1);
X = zeros(1,N);
X(2:k+1) = Ak.*exp(1j*phi);
faxis_bins = 0:1:N-1;
subplot(2,2,1);stem(faxis_bins,abs(X));
title('Generating a multisine starting from frequency domain');
xlabel('bins');
x = N*real(ifft(X));
t = 0:1:N-1;
subplot(2,2,2);plot(t,x);
title('Going to time domain using N*real(ifft(X))');xlabel('index');

%% Task 0.4.3
f1 = 5;
f2 = 15;
k = 30;
fs = 10*max(f1,f2);
fres = abs(f1-f2)/k;
N = fs/fres; 
% fres = fs/N;
X = zeros(1,N);
Ak = ones(k+1,1);
phi = 2*pi*rand(k+1,1);
faxis_Hz = fres * (0:1:N-1);
fa = find(f1 == faxis_Hz); fb = find(f2 == faxis_Hz);
X(fa:1:fb) = Ak.*exp(1j*phi);
subplot(2,2,3);stem(faxis_Hz,abs(X));
title('exciting 31 frequencies between 5 and 15 Hz','starting from frequency domain')
xlabel('Hz');
x = N * real(ifft(X));
n = 0:N-1; Ts = 1/fs ;t = n*Ts;
subplot(2,2,4); plot(t,x); xlabel('sec');