% Vivek Subramaniam (vs2575), Mark Hellinger (msh2188), Jeremy Adkins
% (ja3072), Alfredo Dominguez (ad3307)
%
% Art of Engineering Common Project
% The Baby Boomer 2000X
% December 11, 2015

% This program creates a GUI that models the functioning of the Baby Boomer
% 2000X remote in this Common Project. The remote contains a power button
% that manages the on/off state of the TV, a captions button that turns
% captions on and off, volume up/down buttons, channel up/down buttons, a
% number pad to enter channels, favorite buttons that can be left-clicked
% (to simulate simply pressing the button and releasing it) to navigate to
% a preset favorite channel and also right-clicked (to simulate holding the
% button down) to reassign a different channel to the given favorite
% channel button, a back button that returns the TV to the previous state,
% and a call grandson button which should send a signal to a wifi-enabled
% dongle plugged into the front of the cable box that can send a text
% message to said grandson for assistance.

% The back button stores the previous channel's state in a variable when
% the channel is changed via the number pad, the channel up/down buttons,
% or the favorite buttons, and upon pressing it, it brings the user back to
% the previous channel. The channel the user was on before pressing the
% back button is then stored as a state in the variable, and upon pressing
% the back button again, the user will be returned to the original channel.

% The channels cycle through 350 channels as according to the channel
% lineup listing at:
% https://www.verizon.com/cs/groups/public/documents/adacct/ch_lineup_ultimate_8_2014_ar.pdf

% The favorite channels are preset to FOX News, CSPAN, and GOLF (channel
% numbers according to above document), but they can be reprogrammed by
% right-clicking (simulates holding the button on the real remote) on the
% channel the user wishes to change the favorite channel preset to.

% To run this GUI, simply run this .m file while having the necessary files
% for this GUI in the same folder by typing "run main.m" in the console.

clear all

global TV;
global backState;

initTV();

TV.power = false; % Starts GUI with TV in the off state --- demonstrates need for TV to be turned on to use functions/buttons (except for call grandson, which should work even if TV is off).

RemoteGUI();