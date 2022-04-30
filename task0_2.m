%% Author : Mohamad Saab

%% Task 0.2.1
%DFT of 3 periods of a cosine. Generate a cosine sequence in Matlab
%with a randomly selected phase, and with a period that fits exactly 3 
%times in a data sequence of N = 1000 samples. Make a plot of the DFT 
%of this sequence (amplitude and phase).
clc;
%% Time domain
A = 1; theta = pi; fc = 100;
N = 1000;
ncycles = 4;
fs = fc * N/ncycles;
t = 0:1/fs:ncycles/fc -1/fs;
x = A*cos(2*pi*fc*t + theta);
subplot(2,4,1);
plot(t,x,'r'); title(['sinusoid sequence of ',num2str(ncycles),' cycles']);
xlabel('sec');ylabel('x(n)');

%% Frequency domain
X = 1/N * fftshift(fft(x,N));
f = fs/N * (-N/2:1:N/2 -1);
subplot(2,4,2);
stem(f,abs(X)); title('Amplitude response');
xlabel('Hz');
% phase = atan2(imag(X),real(X))*180/pi;
% subplot(1,3,3);
% stem(f,phase); title('phase spectrum');
%the phase plot was not good to fix it set a threshold
X2 = X;
threshold = max(abs(X))/10000;
X2(abs(X)<threshold) = 0;
phase = atan2(imag(X2),real(X2))*180/pi;
% or can use phase = angle(X2);
subplot(2,4,3);
stem(f,phase); title('Phase spectrum in degrees');
xlabel('Hz'); ylabel('degree');

%% TASK 0.2.2
% Perfect reconstruction. From the DFT plot, check that the condition
% for perfect reconstruction is satisfied. Is there any leakage visible?

% ==> To have perfect reconstruction we should have the period of the 
%     signal fits integer number of times in the window (check screenshot1)
% i.e NTs.fc = int or N/fs . fc = int
if mod((N*fc)/fs,1) == 0
    disp('Perfect reconstruction condition is satisfied');
else
    disp('Perfect reconstruction not satisfied');
end
% if we want to check using the DFT then just check the figure of the
% spectrum, if we only have the ideal cosine amplitude spectrum then no
% leackage , if we have glitches around the main spectrum then we have
% leackage and I can show that by changing ncycles to non integer number.

% Reconstruction of the signal
xrec = N * ifft(ifftshift(X));
subplot(2,4,4);
plot(t,xrec,'b'); title('reconstructed signal from DFT');
xlabel('sec');

%% TASK 0.2.3 
% Interpretation of the frequency axis. At which indices of the DFT do
% you obtain non-zero values? Explain. 
% Keep in mind that Matlab indices start at 1,not at 0.

% ==> non zero values at fc and -fc. In terms of indices this is 498 and
% 504 here , in general it will be at N/2 + 1 +(-) ncycles
% or N(0.5+(-)fc/fs)+1
%% TASK 0.2.4. 
% Frequency axis in bins. 
% Construct the frequency axis for the plots,expressed in bins.
fbins = -N/2: 1: N/2 -1;
subplot(2,4,5);
stem(fbins,abs(X)); title('Amplitude spectrum');
xlabel('frequency in bins');
%% TASK 0.2.5. 
% Frequency axis in Hz. Consider that the sample frequency is f s =100 Hz.
% Construct the frequency axis for the plots, expressed in Hz. 
% Hint: use the results from Task 0.1.1.