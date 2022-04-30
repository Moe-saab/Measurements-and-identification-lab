N = 4096;
n = 0:N-1;
k = 100;
Am = ones(1,k);
%% a) constanct phase 
c = 0.2;
constantphase = c*pi*ones(k,1);
m = (1:k).';

x = Am*cos(2*pi*m*n/N +constantphase);
subplot(3,2,1);plot(n,x);title('multisine signal constant phase');xlabel('index');

% checking if perfect reconstruction is satified by plotting DFT
X = 1/N * fftshift(fft(x,N));
faxis_bins = -N/2:1:N/2 -1;
subplot(3,2,2);stem(faxis_bins,abs(X));title('multisine spectrum constant phase');xlabel('bins');

% crest factor
crestconstant = max(abs(x))/rms(x)


%% b)random phase spectrum with phases drawn from a uniform distribution
uphase = 2*pi*rand(k,1);
x = Am*cos(2*pi*m*n/N +uphase);
subplot(3,2,3);plot(n,x);title('multisine signal random uniform phase');xlabel('index');
X = 1/N * fftshift(fft(x,N));
faxis_bins = -N/2:1:N/2 -1;
subplot(3,2,4);stem(faxis_bins,abs(X));title('multisine spectrum random uniform phase');xlabel('bins');

crestuniform = max(abs(x))/rms(x)

%% c)Schroeder phase
m = (0:k-1).';
Schroederphase = (m.*(m+1)*pi/k);
x = Am*cos(2*pi*m*n/N +Schroederphase);
subplot(3,2,5); plot(n,x);title('multisine signal random Schroeder phase');xlabel('samples');
X = 1/N * fftshift(fft(x,N));
faxis_bins = -N/2:1:N/2 -1;
subplot(3,2,6);plot(faxis_bins,abs(X));title('multisine signal random Schroeder phase spectrum');
xlabel('bins');

crestSchroeder = max(abs(x))/rms(x)
