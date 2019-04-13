clc
[y,Fs] = audioread('sweetdreams.m4a');
 
player = audioplayer(y,Fs);
player.TimerPeriod=0.025;

player.play;

while(player.isplaying)
   newfft(player,y,Fs)
   drawnow;
end