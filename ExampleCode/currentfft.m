%current fft
function currentfft(player,Y,FS)
    sampleNumber=get(player,'CurrentSample');
    timerVal=get(player,'TimerPeriod');
    
    %Get channel one values for our window around the current sample number
    s1=Y(floor(sampleNumber-((timerVal*FS)/2)):floor(sampleNumber+((timerVal*FS)/2)),1);
    
    n = length(s1);
    p = fft(s1); % take the fourier transform
    
    nUniquePts = ceil((n+1)/2);
    p = p(1:nUniquePts); % select just the first half since the second half
    			 % is a mirror image of the first
    p = abs(p); % take the absolute value, or the magnitude
    p = p/n; % scale by the number of points so that
             % the magnitude does not depend on the length
             % of the signal or on its sampling frequency
    
    p = p.^2;  % square it to get the power
    
    % multiply by two
    if rem(n, 2) % odd nfft excludes Nyquist point
        p(2:end) = p(2:end)*2;
    else
        p(2:end -1) = p(2:end -1)*2;
    end
    
    freqArray = (0:nUniquePts-1) * (FS / n); % create the frequency array
    
    scatter(freqArray/1000, p, 'b')
    xlabel('Frequency (kHz)')
    ylabel('Power (watts)')
    title('Frequency vs. Power')
    axis([0 2 0 0.0003]);
    

