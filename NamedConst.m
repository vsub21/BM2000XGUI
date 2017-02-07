classdef NamedConst
    % A list of constants that are related to the navigation of the TV
    % using the remote that should not be changed during execution of the
    % GUI. Includes constants for the min and max values of volume and
    % channel. Channel values are as according to FiOS lineup at:
    % https://www.verizon.com/cs/groups/public/documents/adacct/ch_lineup_ultimate_8_2014_ar.pdf
    
   properties (Constant)
      channelMin = 1;
      channelMax = 350; 
      
      volumeMin = 0;
      volumeMax = 100;
   end
end