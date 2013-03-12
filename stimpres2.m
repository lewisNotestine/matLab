% Learning phase of trials
a=0

for a=0:2
    visStim= fget1(a + '.txt')
    audStim= read(a + '.wav')
    
    display(visStim)
    pause(1)
    wavplay(audstim)
end
