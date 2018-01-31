function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 15-Jan-2018 10:49:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
whichFunction = get(handles.popmenu_which_function,'Value');
ShowFunction(whichFunction);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tbAgents_Callback(hObject, eventdata, handles)
% hObject    handle to tbAgents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbAgents as text
%        str2double(get(hObject,'String')) returns contents of tbAgents as a double


% --- Executes during object creation, after setting all properties.
function tbAgents_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbAgents (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbIterations_Callback(hObject, eventdata, handles)
% hObject    handle to tbIterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbIterations as text
%        str2double(get(hObject,'String')) returns contents of tbIterations as a double


% --- Executes during object creation, after setting all properties.
function tbIterations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbIterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnStart.
function btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 

NUMBER_OF_AGENTS = str2double(get(handles.tbAgents,'String'));
ITERATIONS= str2double(get(handles.tbIterations,'String'));
VMAX = str2double(get(handles.tbVmax,'String'));
C1 = str2double(get(handles.tbC1,'String'));
C2 = str2double(get(handles.tbC2,'String'));
W = str2double(get(handles.tbW,'String'));

WHICH_FUNCTION = get(handles.popmenu_which_function,'Value');
SEARCH_MIN_OR_MAX = get(handles.MIN_MAX,'Value');
PAUSE_TIME = str2double(get(handles.tbPause,'String'));

set(handles.btnStart,'String','Working');
Algorithm(NUMBER_OF_AGENTS,ITERATIONS,VMAX,C1,C2,W,SEARCH_MIN_OR_MAX,WHICH_FUNCTION,PAUSE_TIME);
set(handles.btnStart,'String','Start');

% --- Executes on selection change in popmenu_which_function.
function popmenu_which_function_Callback(hObject, eventdata, handles)
% hObject    handle to popmenu_which_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popmenu_which_function contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popmenu_which_function
whichFunction = get(handles.popmenu_which_function,'Value');
ShowFunction(whichFunction);

% --- Executes during object creation, after setting all properties.
function popmenu_which_function_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popmenu_which_function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbVmax_Callback(hObject, eventdata, handles)
% hObject    handle to tbVmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbVmax as text
%        str2double(get(hObject,'String')) returns contents of tbVmax as a double


% --- Executes during object creation, after setting all properties.
function tbVmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbVmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbC1_Callback(hObject, eventdata, handles)
% hObject    handle to tbC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbC1 as text
%        str2double(get(hObject,'String')) returns contents of tbC1 as a double


% --- Executes during object creation, after setting all properties.
function tbC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbC2_Callback(hObject, eventdata, handles)
% hObject    handle to tbC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbC2 as text
%        str2double(get(hObject,'String')) returns contents of tbC2 as a double


% --- Executes during object creation, after setting all properties.
function tbC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbW_Callback(hObject, eventdata, handles)
% hObject    handle to tbW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbW as text
%        str2double(get(hObject,'String')) returns contents of tbW as a double


% --- Executes during object creation, after setting all properties.
function tbW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tbPause_Callback(hObject, eventdata, handles)
% hObject    handle to tbPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tbPause as text
%        str2double(get(hObject,'String')) returns contents of tbPause as a double


% --- Executes during object creation, after setting all properties.
function tbPause_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tbPause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MIN_MAX.
function MIN_MAX_Callback(hObject, eventdata, handles)
% hObject    handle to MIN_MAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MIN_MAX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MIN_MAX


% --- Executes during object creation, after setting all properties.
function MIN_MAX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MIN_MAX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
