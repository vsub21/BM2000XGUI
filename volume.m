function volume(direction)
% This function helps manage the changing of the volume using the volumeUp
% and volumeDn push buttons on the GUI.

% Max and min volume is defined as a constant in .m file containing 
% constants whose values should not be able to be modified during program 
% execution. The volume cannot exceed the maximum nor can it fall below the
% minimum as defined in the class NamedConst.m.

global TV;

if TV.power == true
    currentVol = TV.volume;
    
    if strcmp(direction, 'up') == true
        % If the max volume has been reached, don't let it go higher.
        if currentVol < NamedConst.volumeMax 
            currentVol = currentVol + 1;
        end
        
    elseif strcmp(direction, 'down') == true
        % If the mix volume has been reached, don't let it go lower.
        if currentVol > NamedConst.volumeMin
            currentVol = currentVol - 1;
        end
    end
    
    TV.volume = currentVol;
    
end