function varargout = guiRobot(varargin)
% GUIROBOT MATLAB code for guiRobot.fig
%      GUIROBOT, by itself, creates a new GUIROBOT or raises the existing
%      singleton*.
%
%      H = GUIROBOT returns the handle to a new GUIROBOT or the handle to
%      the existing singleton*.
%
%      GUIROBOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIROBOT.M with the given input arguments.
%
%      GUIROBOT('Property','Value',...) creates a new GUIROBOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiRobot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiRobot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiRobot

% Last Modified by GUIDE v2.5 25-May-2018 12:34:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiRobot_OpeningFcn, ...
                   'gui_OutputFcn',  @guiRobot_OutputFcn, ...
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


% --- Executes just before guiRobot is made visible.
function guiRobot_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiRobot (see VARARGIN)

% Choose default command line output for guiRobothandles.output = hObject;
handles.shapes = evalin('base','shapes');
robot  = evalin('base','robot');
resetPosition = evalin('base', 'resetPosition');
handles.plotObj = plotEnv(handles.shapes);
robot.plot(resetPosition);

view(45,30);

handles.robot = robot;
handles.GinLemonButton = evalin('base', 'GinLemonPlot');
handles.VodkaOrangeButton = evalin('base', 'VodkaOrangePlot');
handles.RumColaButton = evalin('base', 'RumColaPlot');
handles.BrassMonkeyButton = evalin('base', 'BrassMonkeyPlot');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiRobot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiRobot_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GinLemonButton.
function GinLemonButton_Callback(hObject, ~, handles)
% hObject    handle to GinLemonButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textTitle,'string','Gin Lemon');
msg = sprintf('- Gin\n- Lemon\n');
set(handles.textReceipt,'string',msg);
handles.currentData = handles.GinLemonButton;
plotTraj(handles.robot, handles.plotObj, handles.currentData);
set(handles.textTitle,'string','');
set(handles.textReceipt,'string','');
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in VodkaOrangeButton.
function VodkaOrangeButton_Callback(hObject, ~, handles)
% hObject    handle to VodkaOrangeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textTitle,'string','Vodka Orange');
msg = sprintf('- Vodka\n- Orange Juice\n');
set(handles.textReceipt,'string',msg);
handles.currentData = handles.VodkaOrangeButton;
plotTraj(handles.robot, handles.plotObj, handles.currentData);
set(handles.textTitle,'string','');
set(handles.textReceipt,'string','');
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in RumColaButton.
function RumColaButton_Callback(hObject, ~, handles)
% hObject    handle to RumColaButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textTitle,'string','Rum & Cola');
msg = sprintf('- Rum\n- Cola\n');
set(handles.textReceipt,'string',msg);
handles.currentData = handles.RumColaButton;
plotTraj(handles.robot, handles.plotObj, handles.currentData);
set(handles.textTitle,'string','');
set(handles.textReceipt,'string','');
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in BrassMonkeyButton.
function BrassMonkeyButton_Callback(hObject, ~, handles)
% hObject    handle to BrassMonkeyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.textTitle,'string','BrassMonkey');
msg = sprintf('- Vodka\n- Rum\n- Orange Juice ');
set(handles.textReceipt,'string',msg);
handles.currentData = handles.BrassMonkeyButton;
plotTraj(handles.robot, handles.plotObj, handles.currentData);
set(handles.textTitle,'string','');
set(handles.textReceipt,'string','');
% Update handles structure
guidata(hObject, handles);
