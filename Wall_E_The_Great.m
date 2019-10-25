% Yellow Color = Starting Point
% Blue Color = Patient Waiting
% Green Color = Patient Drop Off
% brick = ConnectBrick('Wall-E');

global key

brick.SetColorMode(2, 2);
color = brick.ColorCode(2);

disp(color);

while (1)
    brick.MoveMotor('A', 20);
    brick.MoveMotor('D', 20);
    
    if (color == 2 || color == 3)  
        InitKeyboard();
        while 1
            angle = brick.GyroAngle(3);
            distance = brick.UltrasonicDist(1);
            pause(0.1);
            switch key
                case 'uparrow'
                    disp('Up Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', 100);
                    brick.MoveMotor('A', 100);
                case 'downarrow'
                    disp('Down Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', -100);
                    brick.MoveMotor('A', -100);
                case 'leftarrow'
                    disp('Left Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', -100);
                    brick.MoveMotor('A', 100);
                 case 'rightarrow'
                    disp('Right Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', 100);
                    brick.MoveMotor('A', -100);
                case 0
                    disp('No Key Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', 0);
                    brick.MoveMotor('A', 0);
                case 'q'
                    break;
            end
        end
        CloseKeyboard();

    elseif (color == 5)
        pause(4);
    end
end
