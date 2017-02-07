function channel(input)
% Responsible for navigation of channels using the channel +/- buttons and
% the favorite channel buttons. If the channel up button is pressed when
% the end of the channel list has been reached, the channel changes to the
% first channel. Similarly, if the channel down button is pressed when the
% begining of the channel list has been reached, the channel changes to the
% last channel, a method which is employed by modern-age TVs.
global TV;
global backState;

if TV.power == true
    currentCh = TV.channel;
    backState = currentCh;
    
    % Following deals with moving up and down with the Channel +/- buttons:
    
    if strcmp(input, 'up') == true
        % If the end of the channel list has been reached, returns to the
        % first channel.
        if currentCh == NamedConst.channelMax
            currentCh = NamedConst.channelMin;
        else
            currentCh = currentCh + 1;
        end
        
    elseif strcmp(input, 'down') == true
        % If the current channel is the first channel, changes the channel
        % to the last channel.
        if currentCh == NamedConst.channelMin
            currentCh = NamedConst.channelMax;
        else
            currentCh = currentCh - 1;
        end
        
    % Following deals with the favorite channel buttons:
    
    elseif strcmp(input, 'fav1') == true
        currentCh = TV.fav1;
    elseif strcmp(input, 'fav2') == true
        currentCh = TV.fav2;
    elseif strcmp(input, 'fav3') == true
        currentCh = TV.fav3;
    end
    
    TV.channel = currentCh;
    
end