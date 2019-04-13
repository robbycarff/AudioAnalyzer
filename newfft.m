%current fft
function newfft(player,Y,Fs)
    sampleNumber=get(player,'CurrentSample');
    timerVal=get(player,'TimerPeriod');
    
    %Get channel one values for our window around the current sample number
    s1=Y(floor(sampleNumber-((timerVal*Fs)/2)):floor(sampleNumber+((timerVal*Fs)/2)),1)
    
    n = length(s1);
    %p = fft(s1); % take the fourier transform
    
    %nUniquePts = ceil((n+1)/2);
    %p = p(1:nUniquePts); % select just the first half since the second half    
    
m=length(s1);        %length of input
n=pow2(nextpow2(m)); %transform length
Y=fft(s1,n);          %Fourier transform with n points in output
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
xlim([0 15000])
xlabel('Frequency (Hz)')
ylabel('Power')
title('periodogram')