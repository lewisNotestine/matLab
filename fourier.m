% fourier.m
% Adapted by Lewis Notestine

% 10-2005

% Fourier analysis on waveform of jaw movement and returns peaks and valleys in interactive graph.


    file = input(' Enter file name + extension: ', 's');     

    md_matrix = load(file);            %loading a file from 'work' directory  
   
    time = md_matrix(:,1)/1000;    %assignment of columns
    distance = md_matrix(:,2)/1000;
    
    plot(time,distance);              %plot oscillogram
    title('jaw movement over time')
    xlabel ('time (msec)')
    ylabel ('excursion (mm)')
    
    pause
    
    Y = fft(distance);                %fourier transform
    N = length (Y);
    Y(1) = [];
    power = abs(Y(1:N/2)).^2
    nyquist = 20;
    freq = (1:N/2)/(N/2)*nyquist;
    
    plot (freq,power), grid on      %periodogram
    axis([0 2 -Inf Inf]);
    title ('periodogram')
    xlabel ('frequency (Hz)')
    ylabel ('amplitude (mm)')

    clicknumber = 5;
    [period, amplitude] = ginput(clicknumber);
    pause(1);
    close;
    
    rows = clicknumber;

    disp(period);
    disp(amplitude);