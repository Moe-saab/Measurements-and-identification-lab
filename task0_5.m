%% Author : Mohamad Saab

%% Task 0.5.1
k = 60;
N = 500;
phi1 = 2*pi*rand(k,1);
Ak = ones(k,1);
X1 = zeros(N,1);
X1(2:k+1) = Ak.*exp(1j*phi1);
faxis_bins = 0:1:N-1;
subplot(3,3,1); stem(faxis_bins,abs(X1)); title('random phase')
xlabel('bins');
n = 0:N-1;
x1 = N*real(ifft(X1));
subplot(3,3,4);plot(n,x1);xlabel('samples');
crest1 = max(abs(x1))/rms(x1)

m = 0:k-1;
phi2 = (m.*(m+1)*pi/k).';
X2 = zeros(N,1);
X2(2:k+1) = Ak.*exp(1j*phi2);
subplot(3,3,2); stem(faxis_bins,abs(X2));title('Schroeder phase');
xlabel('bins');
x2 = N * real(ifft(X2));
subplot(3,3,5); plot(n,x2);xlabel('samples');
crest2 = max(abs(x2))/rms(x2)


phi3 = (m*pi).';
X3 = zeros(N,1);
X3(2:k+1) = Ak.*exp(1j*phi3);
subplot(3,3,3); stem(faxis_bins,abs(X3)); title('linear phase');
xlabel('bins');
x3 = N*real(ifft(X3));
subplot(3,3,6);plot(n,x3);xlabel('samples');
crest3 = max(abs(x3))/rms(x3)


subplot(3,3,[7 8 9]);
hold on
plot(n,x1,n,x2,n,x3);
title('The multisine components in time same graph');legend('x1','x2','x3');