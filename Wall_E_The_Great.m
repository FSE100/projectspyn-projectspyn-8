% Yellow Color = Starting Point
% Blue Color = Patient Waiting/Pick Up
% Green Color = Patient Drop Off
% brick = ConnectBrick('Wall-E');



global key
InitKeyboard();

brick.SetColorMode(2, 3);

% x is the activator for manual control
% d is the distance the untrasonic sensor reads
% forward is how long Wall-E is moving foward,this is used for when Wall-E
% can turn right, he will not right away to avoid a very tight turn
% close is how long Wall-E was been hugging the right wall
x = 0;
d = 30;
forward = 0;
close = 0;

brick.MoveMotor('C', 0);




while 1
    color = brick.ColorCode(3);
    distance = brick.UltrasonicDist(1);
    touch = brick.TouchPressed(2);
    disp(distance)
    
    % if not turning or stoping at a color, Wall-E will go forward
    brick.MoveMotor('D', 90);
    brick.MoveMotor('A', 90);

    % if the button sensor in the front gets activated, Wall-E will back up and then do a
    % 180 and restart his pathfinding
    if (touch == 1)
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', -90);
        brick.MoveMotor('A', -90);
        pause(.7) % moving back
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', 90);
        brick.MoveMotor('A', -90);
        pause(1.5);% moving 180
        forward = 0; % reset the forward variable back to zero because its reseting Wall-Es pathfinding
    end
    
    if (forward == 2) % when forward is 2, that means the space to the right of Wall-E is open and 
        % waiting for it to reach 2 delays Wall-Es turn so he does not do a sharp turn and get caught on an edge 
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', 90);
        brick.MoveMotor('A', -90);
        pause(0.9); % turning right 90
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', 90);
        brick.MoveMotor('A', 90);
        % moves forward again
        
    end
    
    if (forward == 10) % when it reaches ten it resets to Zero so that stops Wall-E from doing two right runs right away
        % it causes Wall-E to wait untill he gets into the next tile unit
        % before it resets back to zero, letting him turn again
        forward = 0;
    end
    
    if (distance < 10) % if he gets too close to the wall to his right he adjusts to the left alittle to try and not get stuck
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', -90);
        brick.MoveMotor('A', 90);
        pause(0.15)% turns left alittle
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('D', 90);
        brick.MoveMotor('A', 90);
        pause(0.35); %goes foward just a hair to get away from the wall
    end
    
    if (distance > 55) % when there is no wall to the right of Wall-E, then the forward variable starts increasing
        forward = forward + 1;
        close = 0; % sets close to zero because heis not hugging a right wall then
    else
        close = close + 1; %increases close because that means there is a right wall next to Wall-E
    end
    
    if (close == 4) %if Wall-E is close to the wall for multiple times in a row, it resets forward to zero
        % this is to stop a logic error of if Wall-E turns right to a tile
        % that has a right wall, this stops the forward variable from
        % getting stuck between 2 and 10
        forward = 0;
    end
    
    if (color == 2 || color == 3) %if Wall-E detects blue or green, it activates the flag variable x 
        % this lets us take manual controll
        x = 1;

    elseif (color == 5) % if it senses red, he stops for 4 seconds
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        pause(4); % stops
        brick.MoveMotor('D', 90);
        brick.MoveMotor('A', 90);
        pause(1); % moves forawrd alittle so he does not stop at the same red strip
    end

    while x == 1   % flag for manual controll
        pause(0.1);
        switch key
            case 'uparrow' % up arrow raises the lift up
                disp('Up Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('C', -20);
            case 'downarrow' % down arrow lowers thelift
                disp('Down Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('C', 8);
            case 'w' % w moves Wall-E forward
                disp('Up Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('D', 90);
                brick.MoveMotor('A', 90);
            case 's' % s moves Wall-E backwards
                disp('Down Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('D', -90);
                brick.MoveMotor('A', -90);
            case 'a' % a moves Wall-E to the left
                disp('Left Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('D', -90);
                brick.MoveMotor('A', 90);
            case 'd' % d moves Wall-E to the right
                disp('Right Arrow Pressed!');
                disp(distance);
                brick.MoveMotor('D', 90);
                brick.MoveMotor('A', -90);
            case 0 % if nothing is pressed, Wall-E stays in place
                brick.MoveMotor('D', 0);
                brick.MoveMotor('A', 0);
            case 'q' % if q is pressed, it untriggers the flag which causes Wall-E to go back to autonomus
                x = 0;
                brick.MoveMotor('D', 0);
                brick.MoveMotor('A', 0);
                brick.MoveMotor('C', 0);
                break;
        end
    end
end
 CloseKeyboard();