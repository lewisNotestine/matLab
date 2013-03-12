% stimpres1.m
%
% Morphemic Structure Presentation, Learning phase 
% Lewis Notestine
% Linguistics Department, University of Oregon
%
% started 9/06/2005
% 
% Presents pre-randomized English non-words to individuals with auditory and
% visual presentation of forms. Intended to teach a set of sixty non-words
% to three different experimental groups.



% Open window, define screen/color parameters
window = Screen(0,'OpenWindow');
ShowCursor(0);	% arrow cursor
HideCursor;
white=WhiteIndex(window);
black=BlackIndex(window);
gray=(white+black)/2;

%define the stimset by importing text files to denote stimuli.
testVis = importdata('testvisx.txt')
testVis2 = char(testVis)

testAud = importdata('testaud.txt')
testAud2 = char(testAud)


i=0;
trials = 120

% Choose fonts 
switch computer 

    case 'PCWIN'
       
        sansSerifFont = 'Arial';
       
    otherwise
        error(['Unsupported OS: ' computer]);
end

% Declare the randomized blocks to use: change filename as arguments used in for-loop. 

% Creates a fixation point (in this case a '+' signs)

% Draw text for visual stimulus. Uses a stimulus set matrix. Operates on a
% character string matrix of pre-randomized stimuli; you must create a differently
% randomized set of stimuli for each participant.

for (i=1:trials)
    
    h = i + 200
    Fs = 22050; % Sample rate
    vocstim = testAud2(i,:) 
    audstim = wavread(vocstim); % auditory stim set
    
    r=Screen(window,'Rect');
    Screen(window,'TextSize',64);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', '+' ,485,410 ,white);
    pause(1);             %pause duration for clear screen
            
    r=Screen(window,'Rect');
    Screen(window,'TextSize',64);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', '+' ,485,410 ,black);
    pause(1.5);             %pause duration for fixation point

    Screen(window,'DrawText','',20,r(RectBottom)-20,white);
    Screen(window,'FillRect');
   
    r=Screen(window,'Rect');
    Screen(window,'TextSize',48);
    Screen(window,'TextFont',sansSerifFont);
    Screen(window,'DrawText', testVis2(i,:) ,400,400 ,black); %stimulus presentation
   

  
    wavplay(audstim,Fs);    % plays auditory stimulus
    
  
     
   
     
    waitsecs(1)
       
    
    load splat;
    wavplay(y,Fs); 
          
 
    
     
    
    pause(2.5);             % Pause duration for stimulus presentation NOTE: use the KbWait command to get times, etc?

    Screen(window,'DrawText','',20,r(RectBottom)-20,white);
    Screen(window,'FillRect');
end

%The syntax above will present a stimulus and redraw (clear the screen),
%rather than putting a new stimulus on top of the old one. 

% Say goodbye
fontSize=Screen(window,'TextSize',40); % save font size and set new size
r=Screen(window,'Rect');
Screen(window,'DrawText','You have concluded this block of the learning phase.',10,r(RectBottom)-150,black);

Screen(window,'DrawText','Press any key to Continue.',20,r(RectBottom)-20,black);
GetChar;

% Close window
ShowCursor;
Screen(window,'Close');

