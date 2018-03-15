fs = 100; % It is sampling frequency
t=0:1/fs:5; % It is time series used to generate signal x
x = 4 * cos(2 * pi * 10 * t + pi / 6); % x is function of t
X = fft(x); % This statement computes Fourier transform of x
n = length(x); % length(x) gives the array length of signal x
c = (-1 * fs) / 2:fs / n:fs / 2 - fs / n; % It generates the frequency series to plot X in frequency domain
subplot(4, 1, 1),plot(t,x); % This subplot shows the signal x vs. time series t
subplot(4, 1 ,2),plot(c,fftshift(abs(X))); % This subplot shows the Fourier spectrum of x with zero frequency component shifted to center
subplot(4, 1, 3),plot(c,angle(X)); % This subplot shows the phase distribution of X (Fourier transform of x)
subplot(4,1 ,4),plot(c,real(X)); % This subplot shows the real component of X spectrum
