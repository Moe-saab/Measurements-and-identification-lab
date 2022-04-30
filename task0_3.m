%% Author : Mohamad Saab

%% Task 0.3.1
N = 1000;
n = 0:N-1;
k = 10;
Am = ones(1,k);
phase = 2*pi*rand(k,1);
m = (1:k).';

x = Am*cos(2*pi*m*n/N +phase); %multiply column by row to save not r by c
subplot(3,2,1);plot(n,x);title('multisine signal');xlabel('index');

% checking if perfect reconstruction is satified by plotting DFT
X = 1/N * fftshift(fft(x,N));
faxis_bins = -N/2:1:N/2 -1;
subplot(3,2,2);stem(faxis_bins,abs(X));title('multisine spectrum');xlabel('bins');

%% Task 0.3.2
fs = 100;
faxis_Hz = fs/N * faxis_bins;
subplot(3,2,4);stem(faxis_Hz,abs(X));title('multisine spectrum');xlabel('Hz');

Ts = 1/fs;
t_axis = n*Ts;
subplot(3,2,3);plot(t_axis,x);title('multisine signal');xlabel('sec');


%% Task 0.3.3
fexcitation = [4 8 12 16 20 24].';
N = 1000; n=0:N-1;
fs = 500;
Ts = 1/fs;
t = n*Ts;
Am = rand(1,length(fexcitation));
phase = 2*pi*rand(length(fexcitation),1);
y = Am*cos(2*pi*fexcitation*n*Ts + phase);
subplot(3,2,5);plot(t,y);title('specific excitation frequencies');xlabel('sec');

Y = fftshift(fft(y,N));
faxis_Hz = fs/N * (-N/2:1:N/2 -1);
subplot(3,2,6);stem(faxis_Hz, abs(Y));title('excited at 4 8 12 16 20 24 Hz');xlabel('Hz');




