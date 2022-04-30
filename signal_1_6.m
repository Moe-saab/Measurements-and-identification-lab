%% The Schroeder multisine
clear all
fs = 8e3;
f1 = 1; f2 = 500;
fres = 1;
N = fs/fres; 
m = f1:f2; k = abs(f1-f2);
phischroeder = (m.*(m+1)*pi/k).';
Ak = ones(k+1,1);
X = zeros(N,1);
X(f1+1:fres:f2+1) = Ak.*exp(1j*phischroeder);

rmsdesired = 0.1;


faxis_Hz = fres * (0:1:N-1);
subplot(2,1,1);stem(faxis_Hz,abs(X));
title('spectrum of multisine with schroeder phase');xlabel('Hz');

x = N * real(ifft(X));
n = 0:N-1; Ts = 1/fs ;t = n*Ts;
subplot(2,1,2);plot(t,x);
title('time domain of multisine with schroeder phase');xlabel('sec');
x = rmsdesired* x/rms(x);


%% QUESTION 1.8.  Differences between periods 
%Compare the measurements of the different periods of the signal in the
%time domain and calculate the FRF for each period of the signals separately
%Explain what you see and decide which periods to select or leave out and why