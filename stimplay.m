Fs = 22050; 


ai = analoginput('winsound');
addchannel(ai,1);
set(ai,'samplerate',Fs);
set(ai,'samplespertrigger', 5*Fs);

ao = analogoutput('winsound');
addchannel(ao,1);
set(ao,'samplerate',Fs);
set(ai,'samplespertrigger', 5*Fs);

data = wavread('Splat');
putdata(ao,data);

set([ai ao],'TriggerType','Manual')
set(ai,'ManualTriggerHwOn','Trigger')

% set(ao,'SamplesOutputFcn',{'qmoredata',ai})
set(ao,'SamplesOutputFcnCount',1000)
set([ai ao],'StopFcn',@stop)

start([ai ao])
trigger([ai ao])

flushdata

delete([ao])


% Note that this number depends on the specific platform you are using. To stop both device objects: stop([ai ao])