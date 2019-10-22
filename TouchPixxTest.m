%%%% Simple touchpixx tests %%%
%%%% By Clara Kuper 2019 %%%

% Grey screen shows location of touch and informs about the function called

%%%%% This part is from ViewPixx Demo
AssertOpenGL;

try
    % We are assuming that the DATAPixx is connected to the highest number screen.
    % If it isn't, then assign screenNumber explicitly here.
    screenNumber=max(Screen('Screens'));

    % We use the imaging pipeline to open a window so that we can get microsecond accurate stimulus onset timetags
    Datapixx('Open');
    PsychImaging('PrepareConfiguration');
    PsychImaging('AddTask', 'General', 'UseDataPixx');
    % Open window
    [w, wRect] = PsychImaging('OpenWindow', screenNumber, 0);
    tStart = getSec;
    winWidth = wRect(3) - wRect(1);
    winHeight = wRect(4) - wRect(2);

    % After OpenWindow so it's under the text generated by Screen
    fprintf('\nTOUCHPixx Whack-A-Mole Demo\n');

    % Configure DATAPixx/TOUCHPixx
    %Datapixx('SetVideoMode', 0);                        % Normal passthrough
    %Datapixx('EnableTouchpixx');                        % Turn on TOUCHPixx hardware driver
    %Datapixx('SetTouchpixxStabilizeDuration', 0.01);    % Stabilize inputs for calibration
    %Datapixx('RegWrRd');
    
    backCol = [128 128 128];
    Screen('FillRect', w, backCol, wRect);
    
    textCol = [0 0 0];
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, floor(50 * winWidth/1920));
    DrawFormattedText(w, 'We have opened a window', 'center', 'center', textCol);
    Screen('Flip', w);
    %isPressed = 0;                          % Wait until panel touch\
    
    %while ~isPressed
    %    Datapixx('RegWrRd');
    %	status =  Datapixx('GetTouchpixxStatus');
    %    isPressed = status.isPressed;
    %end;


    % close window and print time
    %Datapixx('DisableTouchpixx');    % Turn off TOUCHPixx hardware driver
    tEnd  = getSec;
    Screen('CloseAll');
    %Datapixx('Close');
    fprintf('Duration of this open window was:');
    fprintf(tEnd-tStart);
    ShowCursor;
    return;
catch
   % Datapixx('DisableTouchpixx');    % Turn off TOUCHPixx hardware driver
   % Datapixx('Close');
    Screen('CloseAll');
    ShowCursor;
    psychrethrow(psychlasterror);
% Activate touchscreen

% test coordinates
sca

% test log with timestamps

end