function waveblarg

Fs = 11025;
y = wavrecord(5*Fs,Fs,'int16');
wavplay(y,Fs);
wavwrite(y,Fs,'testing2')
end