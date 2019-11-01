% Yellow Color = Starting Point
% Blue Color = Patient Waiting
% Green Color = Patient Drop Off
% brick = ConnectBrick('Wall-E');



global key
InitKeyboard();

brick.SetColorMode(2, 4);
color = brick.ColorCode(4);

while 1
    color = brick.ColorCode(4);
    disp(color)
        if (color == 2 || color == 3) 
            pause(0.1);
            disp(color)            
            switch key
                case 'uparrow'
                    disp('Up Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('C', -18);
                   
                case 'downarrow'
                    disp('Down Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('C', 18);
                case 'w'
                    disp('Up Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', 100);
                    brick.MoveMotor('A', 100);
                case 's'
                    disp('Down Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', -100);
                    brick.MoveMotor('A', -100);
                case 'a'
                    disp('Left Arrow Pressed!');
                    disp(angle);
                    disp(distance);
                    brick.MoveMotor('D', -100);
                    brick.MoveMotor('A', 100);
                case 'd'
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
    
        

        elseif (color == 5)
        pause(4);
        end
end






% while 1
%     disp("Inside While Loop, Motors Running")
%     brick.MoveMotor('A', 20);
%     brick.MoveMotor('D', 20);
%     
%     if (color == 2 || color == 3)  
%         InitKeyboard();
%         
%             angle = brick.GyroAngle(3);
%             distance = brick.UltrasonicDist(1);
%             pause(0.1);
%             switch key
%                 case 'W'
%                     disp('Up Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', 100);
%                     brick.MoveMotor('A', 100);
%                 case 'S'
%                     disp('Down Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', -100);
%                     brick.MoveMotor('A', -100);
%                 case 'A'
%                     disp('Left Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', -100);
%                     brick.MoveMotor('A', 100);
%                  case 'D'
%                     disp('Right Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', 100);
%                     brick.MoveMotor('A', -100);
%                 case 0
%                     disp('No Key Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', 0);
%                     brick.MoveMotor('A', 0);
%                 case 'q'
%                     break;
%             end
%     
%         
% 
%         elseif (color == 5)
%         pause(4);
%     end
% end
%  CloseKeyboard();
