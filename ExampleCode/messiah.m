clear


load handel.mat;
%fs=10000;                     %sampling rate in Hz
t=0:1/Fs:73112*1/Fs;           % music
%x=1.3*sin(2*pi*15*t)...     %15Hz wave
 %+1.7*sin(2*pi*40*(t-2))...%40Hz wave
  %+2.5*randn(size(t));      %random noise, gaussian
%x=exp(-t.^2./(0.01*0.01));
x=cos(2*pi*10000*t).*transpose(y); %.*cos(2*pi*0*t);
 
% user s1 here to compute length 

m=length(x);        %length of input
n=pow2(nextpow2(m)); %transform length
Y=fft(x,n);          %Fourier transform with n points in output
f=[0:1:n-1]*(Fs/n); %Frequency range for plotting fourier transform
power=(abs(Y)).^2/n; %power spectrum. divide by n to get numbers to work.
 
%plot(f, power) 
%xlabel('Frequency (Hz)')
%ylabel('Power')
%title('periodogram')
 
y0=fftshift(Y);  %rearrange y values
f0=[-n/2:1:n/2-1]*(Fs/n); %Frequency range 0-centered
power0=(abs(y0).^2)/n; %power for 0-centered
 
plot(f0,power0)
xlabel('Frequency (Hz)')
ylabel('Power')
title('periodogram')
soundsc(x, Fs)
 
