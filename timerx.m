t = timer('TimerFcn', 'stat=false; disp(''Timer!'')',... 
                'startdelay', 10);
start(t)

stat=1
while(true)
    disp('.')
    pause(1)
end
