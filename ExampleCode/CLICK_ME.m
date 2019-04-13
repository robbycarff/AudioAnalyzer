clc
[y,Fs] = audioread('fur.wav');
 
player = audioplayer(y,Fs);
player.TimerPeriod=0.025;

player.play;

while(player.isplaying)
   currentfft(player,y,Fs)
   drawnow;
end