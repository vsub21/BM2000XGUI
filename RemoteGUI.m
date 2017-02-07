function varargout = RemoteGUI(varargin)
% REMOTEGUI MATLAB code for RemoteGUI.fig
%      REMOTEGUI, by itself, creates a new REMOTEGUI or raises the existing
%      singleton*.
%
%      H = REMOTEGUI returns the handle to a new REMOTEGUI or the handle to
%      the existing singleton*.
%
%      REMOTEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REMOTEGUI.M with the given input arguments.
%
%      REMOTEGUI('Property','Value',...) creates a new REMOTEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RemoteGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RemoteGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RemoteGUI

% Last Modified by GUIDE v2.5 11-Dec-2015 21:25:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RemoteGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RemoteGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RemoteGUI is made visible.
function RemoteGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RemoteGUI (see VARARGIN)

global TV;
tvHandle = 'The Baby Boomer 2000X';
set(handles.tvText, 'String', tvHandle);
% Choose default command line output for RemoteGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RemoteGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RemoteGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in powerButton.
function powerButton_Callback(hObject, eventdata, handles)
% hObject    handle to powerButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;

if TV.power == true
    TV.power = false;
    tvHandle = 'The TV is OFF.';
else
    initTV();
    tvHandle = 'The TV is ON.';
end
  
set(handles.tvText, 'String', tvHandle);


% --- Executes on button press in captionsButton.
function captionsButton_Callback(hObject, eventdata, handles)
% hObject    handle to captionsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV

if TV.power == true
    if TV.captions == true;
        TV.captions = false;
        tvHandle = 'Closed captioning has been turned OFF.';
    else
        TV.captions = true;
        tvHandle = 'Closed captioning has been turned ON.';
    end
    set(handles.tvText, 'String', tvHandle);
end

% --- Executes on button press in volumeDn.
function volumeDn_Callback(hObject, eventdata, handles)
% hObject    handle to volumeDn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power == true
    volume('down');
    tvHandle = horzcat('Volume:', ' ', num2str(TV.volume));
    set(handles.tvText, 'String', tvHandle);
end

% --- Executes on button press in volumeUp.
function volumeUp_Callback(hObject, eventdata, handles)
% hObject    handle to volumeUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power == true
    volume('up');
    tvHandle = horzcat('Volume:', ' ', num2str(TV.volume));
    set(handles.tvText, 'String', tvHandle);
end

% --- Executes on button press in channelUp.
function channelUp_Callback(hObject, eventdata, handles)
% hObject    handle to channelUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power == true
    channel('up');
    tvHandle = horzcat('Channel:', ' ', num2str(TV.channel));
    set(handles.tvText, 'String', tvHandle);
end

% --- Executes on button press in channelDn.
function channelDn_Callback(hObject, eventdata, handles)
% hObject    handle to channelDn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power == true
    channel('down');
    tvHandle = horzcat('Channel:', ' ', num2str(TV.channel));
    set(handles.tvText, 'String', tvHandle);
end

% --- Executes on button press in foxButton.
function foxButton_Callback(hObject, eventdata, handles)
% hObject    handle to foxButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
if TV.power == true
    channel('fav1');
    tvHandle = horzcat('Channel:', ' ', num2str(TV.channel), ' (Favorite Channel #1)');
    set(handles.tvText, 'String', tvHandle);
    pause(1.5);
    set(handles.tvText, 'String', horzcat('Channel:', ' ', num2str(TV.channel)));
end


% --- Executes on button press in cspanButton.
function cspanButton_Callback(hObject, eventdata, handles)
% hObject    handle to cspanButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
if TV.power == true
    channel('fav2');
    tvHandle = horzcat('Channel:', ' ', num2str(TV.channel), ' (Favorite Channel #2)');
    set(handles.tvText, 'String', tvHandle);
    pause(1.5);
    set(handles.tvText, 'String', horzcat('Channel:', ' ', num2str(TV.channel)));
end


% --- Executes on button press in golfButton.
function golfButton_Callback(hObject, eventdata, handles)
% hObject    handle to golfButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
if TV.power == true
    channel('fav3');
    tvHandle = horzcat('Channel:', ' ', num2str(TV.channel), ' (Favorite Channel #3)');
    set(handles.tvText, 'String', tvHandle);
    pause(1.5);
    set(handles.tvText, 'String', horzcat('Channel:', ' ', num2str(TV.channel)));
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over foxButton.
function foxButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to foxButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
global backState
if TV.power
    TV.fav1 = TV.channel;
    set(handles.tvText, 'String', horzcat('Favorite Channel #1 set to channel ', num2str(TV.fav1), '.'));
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over cspanButton.
function cspanButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to cspanButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
global backState
if TV.power
    TV.fav2 = TV.channel;
    set(handles.tvText, 'String', horzcat('Favorite Channel #2 set to channel ', num2str(TV.fav2), '.'));
end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over golfButton.
function golfButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to golfButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
global backState
if TV.power
    backState = TV.channel;
    TV.fav3 = TV.channel;
    set(handles.tvText, 'String', horzcat('Favorite Channel #3 set to channel ', num2str(TV.fav3), '.'));
end

% --- Executes on button press in callGrandsonButton.
function callGrandsonButton_Callback(hObject, eventdata, handles)
% hObject    handle to callGrandsonButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tvText, 'String', 'Contacting Grandson...');
pause(3);
set(handles.tvText, 'String', 'A message has been sent to your grandson indicating your need of assistance.');

% --- Executes on button press in backButton.
function backButton_Callback(hObject, eventdata, handles)
% hObject    handle to backButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV
global backState
if (TV.power)
    oldBack = backState;
    backState = TV.channel;
    TV.channel = oldBack; % Variable assignments swap the values of backState and the current channel.
    
    tvHandle = horzcat('Channel: ', num2str(TV.channel));
    set(handles.tvText, 'String', tvHandle);
end



% --- Executes on button press in numPad1.
function numPad1_Callback(hObject, eventdata, handles)
% hObject    handle to numPad1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('1');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad2.
function numPad2_Callback(hObject, eventdata, handles)
% hObject    handle to numPad2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('2');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad3.
function numPad3_Callback(hObject, eventdata, handles)
% hObject    handle to numPad3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if (TV.power)
    hasError = numPad('3');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad4.
function numPad4_Callback(hObject, eventdata, handles)
% hObject    handle to numPad4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('4');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad5.
function numPad5_Callback(hObject, eventdata, handles)
% hObject    handle to numPad5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('5');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad6.
function numPad6_Callback(hObject, eventdata, handles)
% hObject    handle to numPad6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
    if TV.power
    hasError = numPad('6');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad7.
function numPad7_Callback(hObject, eventdata, handles)
% hObject    handle to numPad7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('7');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad8.
function numPad8_Callback(hObject, eventdata, handles)
% hObject    handle to numPad8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('8');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad9.
function numPad9_Callback(hObject, eventdata, handles)
% hObject    handle to numPad9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError = numPad('9');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end

% --- Executes on button press in numPad0.
function numPad0_Callback(hObject, eventdata, handles)
% hObject    handle to numPad0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TV;
if TV.power
    hasError a= numPad('0');
    if hasError && TV.power == 1
        tvHandle = horzcat('Invalid channel input, please try again.');
        set(handles.tvText, 'String', tvHandle);
    else
        tvHandle = horzcat('Channel: ', num2str(TV.channel));
        set(handles.tvText, 'String', tvHandle);
    end
end
