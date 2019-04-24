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
nUniquePts = ceil((n+1)/2); %test
Y = Y(1:nUniquePts); % test
%f=[0:1:n-1]*(Fs/n); %Frequency range for plotting fourier transform
power=(abs(Y)).^2/n; %power spectrum. divide by n to get numbers to work.
 
y0=fftshift(Y);  %rearrange y values
%f0=[-n/2:1:n/2-1]*(Fs/n); %Frequency range 0-centered
f0=[0:nUniquePts-1]*(Fs/n);
power0=(abs(y0).^2)/n; %power for 0-centered


c=linspace(1,50,length(f0));
C=max(power0);

if (C > 8)
    polarplot(f0, power0, 'r')
else if (C > 2)
        polarplot(f0,power0,'y')
    else
        polarplot(f0,power0,'g')
    end
end
%polarscatter(f0, power0)
%plot(f0,power0,c)
%xlim([0 15000])
%ylim([0 .0003])
%xlabel('Frequency (Hz)')
%ylabel('Power')
%title('periodogram')