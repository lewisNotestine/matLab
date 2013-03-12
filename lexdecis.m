%lexical decision
%lexdec1.m

%Lewis Notestine, Linguistics Department, University of Oregon

%Presents stimuli from a randomized set of 180 English-like non-words. 
%Participants indicate whether or not the word was part of a previously
%learned set.
%
%The design randomizes sixty familiar non-words and sixty novel non-words; 
%The participants indicate whether the words were previously learned or not

% Open window, define screen/color parameters
window = Screen(0,'OpenWindow');
ShowCursor(0);	% arrow cursor
HideCursor;
white=WhiteIndex(window);
black=BlackIndex(window);
gray=(white+black)/2;
trials = 120 

%define the stimset by importing text files to denote stimuli.
stim = importdata('lexstim.txt');
stim2 = char(stim);   %   The set of familiar stimuli


% Choose fonts 

sansSerifFont = 'Arial';
       
for (i=1:trials)
    
    r=Screen(window,'Rect');
    Screen(window,'TextSize',64);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', '+' ,485,410 ,white);
    pause(.5);             %pause duration for clear screen
            
    r=Screen(window,'Rect');
    Screen(window,'TextSize',64);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', ' XXXXX' ,360,400 ,black);
    pause(0.5);             %pause duration for forward mask

    Screen(window,'DrawText','',20,r(RectBottom)-20,white);
    Screen(window,'FillRect');
   
    r=Screen(window,'Rect');
    Screen(window,'TextSize',48);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', stim2(i,:), 400,400 ,black); %STIMULUS PRESENTATION
       

    % use the KbWait command to get times, etc?

        startSecs = GetSecs;
    while 1
        [keyIsDown,timeSecs,keyCode] = KbCheck;
            if keyIsDown
            char = KbName(keyCode);
            % The initial 1 in the fprintf is needed. Otherwise '5%' won't print.
            fprintf(1,'"%s" hit at time %.3f s\n',char,timeSecs-startSecs);
           
	end
	while KbCheck; end
	

    
    %clears window
    Screen(window,'DrawText','',20,r(RectBottom)-20,white);
    Screen(window,'FillRect');
    
    end