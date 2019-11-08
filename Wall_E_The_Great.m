% Yellow Color = Starting Point
% Blue Color = Patient Waiting/Pick Up
% Green Color = Patient Drop Off
% brick = ConnectBrick('Wall-E');



global key
InitKeyboard();

brick.SetColorMode(2, 4);
brick.GyroCalibrate(3);
x = 0;
d = 15;





while 1
    color = brick.ColorCode(4);
    angle = brick.GyroAngle(3);
    distance = brick.UltrasonicDist(1);
    disp(color)
    pause(0.1);
    disp(distance)
    
    
  
    if (color == 2 || color == 3)
        x = 1;

    elseif (color == 5)
        brick.MoveMotor('D', 0);
        brick.MoveMotor('A', 0);
        pause(4);
    end

    
 
        pause(0.1)
        disp(color)
        
        if (distance <= d)
            
            brick.MoveMotor('D', 90);
            brick.MoveMotor('A', -90);
            
          
        elseif (distance > d)
            
            brick.MoveMotor('D', 90);
            brick.MoveMotor('A', 90);
            
        end
            
        
   
    
    
    while x == 1   
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
                brick.MoveMotor('C', 10);
            case 'w'
                disp('Up Arrow Pressed!');
                disp(angle);
                disp(distance);
                brick.MoveMotor('D', 90);
                brick.MoveMotor('A', 90);
            case 's'
                disp('Down Arrow Pressed!');
                disp(angle);
                disp(distance);
                brick.MoveMotor('D', -90);
                brick.MoveMotor('A', -90);
            case 'a'
                disp('Left Arrow Pressed!');
                disp(angle);
                disp(distance);
                brick.MoveMotor('D', -90);
                brick.MoveMotor('A', 90);
            case 'd'
                disp('Right Arrow Pressed!');
                disp(angle);
                disp(distance);
                brick.MoveMotor('D', 90);
                brick.MoveMotor('A', -90);
            case 0
                brick.MoveMotor('D', 0);
                brick.MoveMotor('A', 0);
            case 'q'
                x = 0;
                brick.MoveMotor('D', 0);
                brick.MoveMotor('A', 0);
                break;
        end
    end
    
    disp("PPPPPPPPPPP")
end
% while 1
%     color = brick.ColorCode(4);
%     angle = brick.GyroAngle(3);
%     distance = brick.UltrasonicDist(1);
%     disp(color)
%         if (color == 2 || color == 3) 
%             pause(0.1);
%             disp(color)            
%             switch key
%                 case 'uparrow'
%                     disp('Up Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('C', -18);
%                    
%                 case 'downarrow'
%                     disp('Down Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('C', 18);
%                 case 'w'
%                     disp('Up Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', 100);
%                     brick.MoveMotor('A', 100);
%                 case 's'
%                     disp('Down Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', -100);
%                     brick.MoveMotor('A', -100);
%                 case 'a'
%                     disp('Left Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', -100);
%                     brick.MoveMotor('A', 100);
%                 case 'd'
%                     disp('Right Arrow Pressed!');
%                     disp(angle);
%                     disp(distance);
%                     brick.MoveMotor('D', 100);
%                     brick.MoveMotor('A', -100);
%                 case 'q'
%                     break;
%             
%             end
%     
%         
% 
%         elseif (color == 5)
%             brick.MoveMotor('D', 0);
%             brick.MoveMotor('A', 0);
%         end
% end
 CloseKeyboard();
