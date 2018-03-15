function varargout = digital_filters(varargin)
% DIGITAL_FILTERS MATLAB code for digital_filters.fig
%      DIGITAL_FILTERS, by itself, creates a new DIGITAL_FILTERS or raises the existing
%      singleton*.
%
%      H = DIGITAL_FILTERS returns the handle to a new DIGITAL_FILTERS or the handle to
%      the existing singleton*.
%
%      DIGITAL_FILTERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITAL_FILTERS.M with the given input arguments.
%
%      DIGITAL_FILTERS('Property','Value',...) creates a new DIGITAL_FILTERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before digital_filters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to digital_filters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help digital_filters


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @digital_filters_OpeningFcn, ...
                   'gui_OutputFcn',  @digital_filters_OutputFcn, ...
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


% --- Executes just before digital_filters is made visible.
function digital_filters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to digital_filters (see VARARGIN)


%draw unit circle
c_draw(hObject, eventdata, handles);




handles.p=[];   % Array holds poles in complex formula
handles.z=[];   % Array holds zeros in complex formula

handles.A=[];   % Array holds poles points in the listBox in string formula
handles.B=[];   % Array holds zeros points in the listBox in string formula


% Choose default command line output for digital_filters
handles.output = hObject;
handles.output = hObject;
handles.state = 0;
handles.Fs = 8000;

global nBits;
nBits = 24;
global recObj;
recObj = audiorecorder(handles.Fs,nBits,1);
set(recObj,'TimerPeriod',0.05,'TimerFcn',{@audioTimerCallback,handles});




% Update handles structure
guidata(hObject, handles);

function audioTimerCallback(hObject,event,handles)
if(isempty(hObject))
    return;
end
signal = getaudiodata(hObject);
plot(handles.axes4, signal);


axes(handles.axes6)
handles.y_fft=fft(signal);
plot(handles.axes6, abs(handles.y_fft));


% UIWAIT makes digital_filters wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullfilename
[basename, folder]= uigetfile();
fullfilename= fullfile(folder,basename);
load(fullfilename);
axes(handles.axes4)
plot(val(1,:));
xlabel('Signal in time domain before filteration')
axes(handles.axes6)
handles.y_fft=fft(val(1,:));
plot(abs(handles.y_fft))
xlabel('Signal in freq domain before filteration')


% Choose default command line output for digital_filters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = digital_filters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, ~, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in PP.
function PP_Callback(hObject, eventdata, handles)
% hObject    handle to PP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%click to add a pole point in the unit circle
[x,y]=ginput(1);

%push a point and its conjugate to the poles array 
handles.p(length(handles.p)+1)=x+1j*y;
handles.p(length(handles.p)+1)=x+1j*(-y);

% Update handles structure
guidata(hObject, handles);

%plot the freq response and its effect in the original signal
freq_plot(hObject, eventdata, handles);

%push a point and its conjugate to the poles listbox array 
handles.A{length(handles.A)+1}=['(',num2str(x),' , ',num2str(y),')'];
handles.A{length(handles.A)+1}=['(',num2str(x),' , ',num2str(-y),')'];

%show the point in the last point in the edit line
set(handles.edit1,'String' ,handles.A{length(handles.A)});

%show the listbox with all added points
set(handles.listbox1,'String',(handles.A));

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in ZZ.
function ZZ_Callback(hObject, eventdata, handles)
% hObject    handle to ZZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%click to add a zero point in the unit circle
[x,y]=ginput(1);

%push a point and its conjugate to the zeros array 
handles.z(length(handles.z)+1)=x+1j*y;
handles.z(length(handles.z)+1)=x+1j*(-y);

% Update handles structure
guidata(hObject, handles);

%plot the freq response and its effect in the original signal
freq_plot(hObject, eventdata, handles);

%push a point and its conjugate to the zeros listbox array 
handles.B{length(handles.B)+1}=['(',num2str(x),' , ',num2str(y),')'];
handles.B{length(handles.B)+1}=['(',num2str(x),' , ',num2str(-y),')'];

%show the point in the last point in the edit line
set(handles.edit2,'String' ,handles.B{length(handles.B)});

%show the listbox with all added points
set(handles.listbox2,'String',(handles.B));

% Update handles structure
guidata(hObject, handles);



% --- Executes on button press in nP.
function nP_Callback(hObject, eventdata, handles)
% hObject    handle to nP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%click to remove a pole point in the unit circle
[x,y]=ginput(1);

%search for the selected pole from the poles array and remove it
temp=find(real(handles.p <(x+0.1)) & real(handles.p>(x-0.1)) );
handles.p(find(real(handles.p <(x+0.1)) & real(handles.p>(x-0.1)) ))=[];

%remove the selected pole from  the listBox
handles.A(temp)=[];

% Update handles structure
guidata(hObject, handles);

%plot the freq response and its effect in the original signal
freq_plot(hObject, eventdata, handles);

%show the listbox after removing  points
set(handles.listbox1,'String',handles.A);

% Update handles structure
guidata(hObject, handles);

set(handles.edit1,'String','');
set(handles.edit2,'String','');
set(handles.p_x,'String','');
set(handles.p_y,'String','');

% --- Executes on button press in nZ.
function nZ_Callback(hObject, eventdata, handles)
% hObject    handle to nZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%click to remove a zero point in the unit circle
[x,y]=ginput(1);

%search for the selected zero from the zero array and remove it
temp=find((real(handles.z <(x+0.1)) & real(handles.z>(x-0.1))));
handles.z(find((real(handles.z <(x+0.1)) & real(handles.z>(x-0.1)))))=[];

%remove the selected zero from  the listBox
handles.B(temp)=[];

% Update handles structure
guidata(hObject, handles);

%plot the freq response and its effect in the original signal
freq_plot(hObject, eventdata, handles);

%show the listbox after removing points
set(handles.listbox2,'String',handles.B);
% Update handles structure
guidata(hObject, handles);

set(handles.edit1,'String','');
set(handles.edit2,'String','');
set(handles.z_x,'String','');
set(handles.z_y,'String','');


% --- Executes on button press in nA.
function nA_Callback(hObject, eventdata, handles)
% hObject    handle to nA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%clear all arrays
handles.p=[];
handles.z=[];
handles.A=[];
handles.B=[];

%clear all plots
cla(handles.axes1,'reset')
cla(handles.axes2,'reset')
cla(handles.axes3,'reset')
cla(handles.axes5,'reset')
cla(handles.axes7,'reset')
cla(handles.axes4,'reset')
cla(handles.axes6,'reset')

c_draw(hObject, eventdata, handles)

%update the listBoxes after clearing all
set(handles.listbox1,'String',handles.p);
set(handles.listbox2,'String',handles.z);
set(handles.edit1,'String','');
set(handles.edit2,'String','');
set(handles.p_x,'String','');
set(handles.p_y,'String','');
set(handles.z_x,'String','');
set(handles.z_y,'String','');
% Update handles structure
guidata(hObject, handles);

function p_x_Callback(hObject, eventdata, handles)
% hObject    handle to p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_x as text
%        str2double(get(hObject,'String')) returns contents of p_x as a double

% --- Executes during object creation, after setting all properties.
function p_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_y_Callback(hObject, eventdata, handles)
% hObject    handle to p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_y as text
%        str2double(get(hObject,'String')) returns contents of p_y as a double


% --- Executes during object creation, after setting all properties.
function p_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_y_Callback(hObject, eventdata, handles)
% hObject    handle to z_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_y as text
%        str2double(get(hObject,'String')) returns contents of z_y as a double


% --- Executes during object creation, after setting all properties.
function z_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_x_Callback(hObject, eventdata, handles)
% hObject    handle to z_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_x as text
%        str2double(get(hObject,'String')) returns contents of z_x as a double



% --- Executes during object creation, after setting all properties.
function z_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_poles.
function add_poles_Callback(hObject, eventdata, handles)
% hObject    handle to add_poles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%add poles manually
x=str2num(get(handles.p_x,'String'));
y=str2num(get(handles.p_y,'String'));
handles.p(length(handles.p)+1)=x+1j*y;
handles.p(length(handles.p)+1)=x+1j*(-y);
handles.A{length(handles.A)+1}=['(',num2str(x),' , ',num2str(y),')'];
handles.A{length(handles.A)+1}=['(',num2str(x),' , ',num2str(-y),')'];

% Update handles structure
guidata(hObject, handles);
set(handles.listbox1,'String',handles.A);


freq_plot(hObject, eventdata, handles);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in add_zeros.
function add_zeros_Callback(hObject, eventdata, handles)
% hObject    handle to add_zeros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%add zeros manually
x=str2num(get(handles.z_x,'String'));
y=str2num(get(handles.z_y,'String'));
handles.z(length(handles.z)+1)=x+1j*y;
handles.z(length(handles.z)+1)=x+1j*(-y);


handles.B{length(handles.B)+1}=['(',num2str(x),' , ',num2str(y),')'];
handles.B{length(handles.B)+1}=['(',num2str(x),' , ',num2str(-y),')'];

% Update handles structure
guidata(hObject, handles);

freq_plot(hObject, eventdata, handles);
set(handles.listbox2,'String',handles.B);

% Update handles structure
guidata(hObject, handles);

function c_draw(hObject, eventdata, handles)
%draw unit circle
circle_1 = exp(1i*(0:63)*2*pi/64); 
 axes(handles.axes1)
plot(real(circle_1),imag(circle_1),'.');

axis([-2 2 -2 2]); 
axis('equal'); 
hold on
plot( [0 0], [1.5 -1.5], '-')
plot( [1.5 -1.5], [0 0], '-')
xlim([-1.5 1.5])
ylim([-1.5 1.5])
hold off;
% Update handles structure
guidata(hObject, handles);

function freq_plot(hObject, eventdata, handles)

%clear the unit circuit axes
cla(handles.axes1,'reset');
axes(handles.axes1)
c_draw(hObject, eventdata, handles);
hold on

%plot poles and zeros markers
plot_p=plot(real(handles.p),imag(handles.p),'X');
plot_z=plot(real(handles.z),imag(handles.z),'O');
set(plot_p,'markersize',8,'linewidth',2);
set(plot_z,'markersize',8,'linewidth',2);
hold off;

%Get the transfer function coeffecients
[b,a]=zp2tf(handles.z',handles.p,1);






%Get the frequency response 
[h,w] = freqz(b,a,length(handles.y_fft));



%plot the frequency response mag 
axes(handles.axes2)
plot(w/pi,20*log10(abs(h)))

xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
grid on;

%plot the frequency response phase
axes(handles.axes3)
plot(w/pi,20*log10(angle(h)))

xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase (dB)')
grid on;

%apply the filter in the orignial signal
filter=h'.*handles.y_fft;

axes(handles.axes5)
plot(real(ifft(filter)))

xlabel('Signal in time domain after filteration')

%plot the filtered signal in time and freq domains
axes(handles.axes7)
plot(abs(filter))

xlabel('fft after filteration')
xlabel('Signal in freq domain after filteration')
  
% Update handles structure
guidata(hObject, handles);

  
     


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global recObj;


if handles.state == 0 
    disp('start recording')
    set(hObject,'String','Pause');
    record(recObj);
    handles.state =1 ;
    %disable button

else
    disp('stop recording')
    set(hObject,'String','Record');
    stop(recObj);
    handles.state = 0;
   

end

guidata(hObject,handles)
