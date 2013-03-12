function WaveRecorder
 Fs= 22050
 load splat 
    
 wavplay(y,Fs)
 wavwrite(y,Fs,16,'splat') 
    
end