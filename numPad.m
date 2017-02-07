function hasError = numPad(num)
% This class manages the input for channels by the user using the number
% pad on the GUI. The user can enter up to three numbers to for a 
% three-digit channel number and the channel will be changed to that
% channel number. A one-digit and two-digit channel number can also be
% entered by simply entering the one- or two-digit channel number within
% the span of 1.5 seconds from the moment the first digit is entered, 
% changing the channel to the given one- or two- digit number. If it
% is detected that three-digits have been entered within this time, the
% channel will then change the channel to that three-digit channel before
% the time runs out.

% If the user enters a number that is greater than the value
% of the greatest channel in the channel lineup as defined in NamedConst.m,
% this function will return a boolean inidicating that the input given is
% invalid. This boolean is then used to determine what output will be
% presented in the GUI.
global TV;
global backState;
global temp;

if TV.power == true
    temp = strcat(temp, num);
    oldNum = temp;
    if length(temp) < 3
        pause(1.5);
    end
    if strcmp(temp, oldNum) == true
        if temp(length(temp)) == num
            temp = str2double(temp);
            % Input should also be considered invalid if channel is '0',
            % '00', or '000', so these are also included in the conditional
            % to check for invalid input.
            if temp < NamedConst.channelMax + 1 && ~strcmp(num2str(temp), '0') &&  ~strcmp(num2str(temp), '00') &&  ~strcmp(num2str(temp), '000')
                backState = TV.channel; % To store old value of channel for use with back button
                TV.channel = temp;
                hasError = false;
            else
                disp(horzcat('Channel', ' ', num2str(temp), ' ', 'is not available.')) % For console purposes
                hasError = true;
            end
            temp = '';
        end
    end
end