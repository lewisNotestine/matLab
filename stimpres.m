window = Screen(0,'OpenWindow');
ShowCursor(0);	% arrow cursor
HideCursor;
white=WhiteIndex(window);
black=BlackIndex(window);
gray=(white+black)/2;




    
    r=Screen(window,'Rect');          
    Screen(window,'TextSize',48)
    Screen(window,'DrawText','Some dimmer bigger text', 250, 250, black);
    Screen(window,'TextFont', sansSerifFont);
    


    
