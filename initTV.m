function initTV()
% Initializes global TV objects to be used in the program, including power,
% channel, volume, captions, and the favorite channels.

global TV;

if isempty(TV)
    disp('This TV has been initialized.')
end

TV.power = true;
TV.channel = 1;
TV.volume = 20;
TV.captions = false;

% Channel listing taken from the following document titled "Verizon FiOS
% TV Channel Lineup - Effective August 2014 - Ultimate HD" :
% https://www.verizon.com/cs/groups/public/documents/adacct/ch_lineup_ultimate_8_2014_ar.pdf
% 
% FOX News, C-SPAN, and GOLF channel listings are chosen as listed from the
% above PDF.

TV.fav1 = 118;
TV.fav2 = 109;
TV.fav3 = 93;

end
