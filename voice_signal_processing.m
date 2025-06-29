function varargout = voice_signal_processing(varargin)
%此为主GUI的程序，主要功能：文件的打开与保存，各种加噪处理，时频分析，经典滤波与现代滤波，歌声的分离与评价，实时频谱播放与频谱均衡等。
% VOICE_SIGNAL_PROCESSING MATLAB code for voice_signal_processing.fig
%      VOICE_SIGNAL_PROCESSING, by itself, creates a new VOICE_SIGNAL_PROCESSING or raises the existing
%      singleton*.
%      H = VOICE_SIGNAL_PROCESSING returns the handle to a new VOICE_SIGNAL_PROCESSING or the handle to
%      the existing singleton*.
%
%      VOICE_SIGNAL_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOICE_SIGNAL_PROCESSING.M with the given input arguments.
%
%      VOICE_SIGNAL_PROCESSING('Property','Value',...) creates a new VOICE_SIGNAL_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before voice_signal_processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to voice_signal_processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help voice_signal_processing

% Last Modified by GUIDE v2.5 01-Jun-2017 15:59:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @voice_signal_processing_OpeningFcn, ...
                   'gui_OutputFcn',  @voice_signal_processing_OutputFcn, ...
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


% --- Executes just before voice_signal_processing is made visible.
function voice_signal_processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to voice_signal_processing (see VARARGIN)

% Choose default command line output for voice_signal_processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes voice_signal_processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = voice_signal_processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global pathname;
[x,Fs]= audioread([pathname,filename]);
x=x(:,1);
handles.r=audioplayer(x,Fs);
play(handles.r);
handles.x=x;
handles.Fs=Fs;
guidata(hObject,handles);  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.r);
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.nr=audioplayer(handles.nx,handles.Fs);
play(handles.nr);
guidata(hObject,handles); 


function edit1_Callback(hObject, eventdata, handles)
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global pathname;
[filename, pathname] = uigetfile({'*.mp3;*.wav','All music Files';...
'*.*','All Files' });
set(handles.edit1,'string',filename);
[x,Fs]= audioread([pathname,filename]);
x=x(:,1);
handles.x=x;
handles.Fs=Fs;
guidata(hObject,handles);  

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filenameE;
global pathnameE;
global filenameA;
global pathnameA;
global filename1;
global pathname1;
global lambda;
a=isempty(get(handles.edit15,'String'));
b=isempty(get(handles.edit16,'String'));
c=isempty(pathname1);
if a+b+c==0
    [xE,Fs]= audioread([pathnameE,filenameE]);
    [xA,Fs]= audioread([pathnameA,filenameA]);
    xE=xE(:,1);
    xA=xA(:,1);
    n=min([length(xE) length(xE)]);
    xE=xE(1:n); 
    xA=xA(1:n); 
    wavinmix=xE+xA;
    [d,i,a,nd]=SVS1(xA,xE,wavinmix,Fs,lambda,[pathname1,filename1]);
    set(handles.edit11,'string',d);
    set(handles.edit12,'string',i);
    set(handles.edit14,'string',a);
    set(handles.edit13,'string',nd);
end
 if a==1
    errordlg('请输入原始人声','提示'); 
 end
 if b==1
    errordlg('请输入原始伴奏声','提示'); 
 end
 if c==1
    errordlg('未作语音分离处理','提示'); 
 end




% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.x;
N=length(x);
A=inputdlg('请输入随机噪声的幅度');
A= str2num(A{1,1});
noise1=A*randn(N,1);  %产生等长度的随机噪声信号(这里的噪声的大小取决于随机函数的幅度倍数） 
x=x+noise1;        %将两个信号叠加成一个新的信号——加噪声处理    
handles.nx=x+noise1;  
guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.x;
N=length(x);
snr=inputdlg('请输入信噪比');
snr= str2num(snr{1,1});
noise3 = awgn(x,snr,'measured'); %如果SIGPOWER是数值，则其代表以dBW为单位的信号强度；如果SIGPOWER为'measured'，则函数将在加入噪声之前测定信号强度。
%noise3 = wgn(1,N,snr);  %产生等长度的高斯白噪声信号(这里的噪声的大小取决于随机函数的幅度倍数） 
 
handles.nx=x+noise3;  
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.x;
N=length(x);
A=inputdlg('请输入正余弦噪声的幅度');
A= str2num(A{1,1});
t=1:1:N;
noise2=A*cos(2*pi*50*t);   %产生等长度的正余弦噪声信号(这里的噪声的大小取决于随机函数的幅度倍数） 

handles.nx=x+noise2';  
guidata(hObject,handles);



% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
str=get(hObject,'string');
axes(handles.axes4);
cla;
Fs=handles.Fs;
x=handles.nx;
switch str
    case '时域图'
        n=length(x);
        t=1/Fs:1/Fs:n/Fs;
        plot(t,x,'g');
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
     
    case '频域图' 
        s=length(x);
        X = fft(x,s); 
        Pyy = X.* conj(X) / s; 
        h=floor(s/2); 
        f=Fs*(0:h)/s; 
        plot(f,Pyy(1:h+1));xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
 
    case '语谱图'  
        stft(x,128, 128, 0, 32000);
    case '三维时频图'
        stft3d(x,128, 128, 0, 32000);
end;
guidata(hObject,handles);  

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.nr);
guidata(hObject,handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.fr=audioplayer(handles.fx,handles.Fs);
play(handles.fr);
guidata(hObject,handles); 

% --- Executes on button press in pushbutton5.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.fr);
guidata(hObject,handles);

% --- Executes on button press in pushbutton6.


% --- Executes when selected object is changed in uipane1.
function uipane1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipane1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global filename;
global pathname;
global X1;global Y1;

str=get(hObject,'string');
axes(handles.axes3);
cla;
[x,Fs]= wavread([pathname,filename]);
x=x(:,1);
switch str
    case '时域图'
        n=length(x);
        t=1/Fs:1/Fs:n/Fs;
        plot(t,x,'g');
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
  
    case '频域图' 
        s=length(x);
        X = fft(x,s); 
        Pyy = X.* conj(X) / s; 
        h=floor(s/2); 
        f=Fs*(0:h)/s; 
        plot(f,Pyy(1:h+1));xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
        
    case '语谱图'  
        stft(x,128, 128, 0, 32000);
    case '三维时频图'
        stft3d(x,128, 128, 0, 32000);
end;
guidata(hObject,handles);  



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=handles.x;
Fs=handles.Fs;
[filename, pathname] = uigetfile({'*.mp3;*.wav','All music Files';...
'*.*','All Files' });
set(handles.edit2,'string',filename);
snr=inputdlg('请输入信噪比');
snr= str2num(snr{1,1});
[Y,NOISE] = add_noisefile(x,[pathname,filename],snr,Fs);
handles.nx=Y;
guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[s,v]=listdlg('PromptString','选择窗函数类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'hamming','hanning','kaiser','chebwin'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    x=handles.x;
    Fs=handles.Fs;
    a=inputdlg({'wp1','ws1'},'设置滤波器参数',1,{'1000','1200'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wn = (2*wp1/Fs+2*ws1/Fs)/2;
    m=(0.3*wp1)/(Fs/2);%定义过度带宽??
    M=round(8/m);%定义窗函数的长度??
    N=M-1;%定义滤波器的阶数??
    
    switch  s
         case 1                                     %hamming窗
             window =hamming(N+1);
             b = fir1(N,wn,window);
         case 2                                    %hamming窗
             window =hanning(N+1);
             b = fir1(N,wn,window);
         case 3                                    %kaiser窗
            window = kaiser(N+1);
             b = fir1(N,wn,window);
         case 4                                     %chebwin窗
             window =chebwin(N+1);
             b = fir1(N,wn,window);
    end
    y = conv(x,b);
    handles.fx=y;
end
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[s,v]=listdlg('PromptString','选择窗函数类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'hamming','hanning','kaiser','chebwin'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    x=handles.x;
    Fs=handles.Fs;
    a=inputdlg({'wp1','ws1'},'设置滤波器参数',1,{'1200','800'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wn = (2*wp1/Fs+2*ws1/Fs)/2;
    m=(0.3*wp1)/(Fs/2);%定义过度带宽??
    M=round(8/m);%定义窗函数的长度??
    N=M-1;%定义滤波器的阶数??
     N=N+mod(N,2);
    switch  s
         case 1                                     %hamming窗
             window =hamming(N+1);
             b = fir1(N,wn,'high',window);
         case 2                                    %hamming窗
             window =hanning(N+1);
             b = fir1(N,wn,'high',window);
         case 3                                    %kaiser窗
            window = kaiser(N+1);
             b = fir1(N,wn,'high',window);
         case 4                                     %chebwin窗
             window =chebwin(N+1);
             b = fir1(N,wn,'high',window);
    end
    y = conv(x,b);
    handles.fx=y;
end
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 [s,v]=listdlg('PromptString','选择窗函数类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'hamming','hanning','kaiser','chebwin'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    x=handles.x;
    Fs=handles.Fs;
    a=inputdlg({'wp1','ws1','wp2','ws2'},'设置滤波器参数',1,{'1000','800','1500','1700'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wp2= str2double(a{3,1});
    ws2= str2double(a{4,1});
    wn = [(2*wp1/Fs+2*ws1/Fs)/2 (2*wp2/Fs+2*ws2/Fs)/2];
    m=(0.3*wp1)/(Fs/2);%定义过度带宽??
    M=round(8/m);%定义窗函数的长度??
    N=M-1;%定义滤波器的阶数??
    
    switch  s
         case 1                                     %hamming窗
             window =hamming(N+1);
             b = fir1(N,wn,window);
         case 2                                    %hamming窗
             window =hanning(N+1);
             b = fir1(N,wn,window);
         case 3                                    %kaiser窗
            window = kaiser(N+1);
             b = fir1(N,wn,window);
         case 4                                     %chebwin窗
             window =chebwin(N+1);
             b = fir1(N,wn,window);
    end
    y = conv(x,b);
    handles.fx=y;
end     
guidata(hObject,handles);
% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [s,v]=listdlg('PromptString','选择窗函数类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'hamming','hanning','kaiser','chebwin'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    x=handles.x;
    Fs=handles.Fs;
    a=inputdlg({'wp1','ws1','wp2','ws2'},'设置滤波器参数',1,{'800','1000','1700','1500'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wp2= str2double(a{3,1});
    ws2= str2double(a{4,1});
    wn = [(2*wp1/Fs+2*ws1/Fs)/2 (2*wp2/Fs+2*ws2/Fs)/2];
    m=(0.3*wp1)/(Fs/2);%定义过度带宽??
    M=round(8/m);%定义窗函数的长度??
    N=M-1;%定义滤波器的阶数??
    N=N+mod(N,2);%高通、带阻滤波器的阶数应该控制为奇数，因为如果阶数为偶数，则在π点必有一零点，这对于高通带阻来说是不允许的
    switch  s
         case 1                                     %hamming窗
             window =hamming(N+1);
             b = fir1(N,wn,'stop',window);
         case 2                                    %hamming窗
             window =hanning(N+1);
             b = fir1(N,wn,'stop',window);
         case 3                                    %kaiser窗
            window = kaiser(N+1);
             b = fir1(N,wn,'stop',window);
         case 4                                     %chebwin窗
             window =chebwin(N+1);
             b = fir1(N,wn,'stop',window);
    end
    y = conv(x,b);
    handles.fx=y;
end
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[s,v]=listdlg('PromptString','选择滤波器类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'butter','cheby1','cheby2'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    a=inputdlg({'wp1','ws1','rp','rs'},'设置滤波器参数',1,{'1000','1200','1','20'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    rp= str2double(a{3,1});
    rs= str2double(a{4,1}); 
    x=handles.x;
    Fs=handles.Fs;
    N=Fs; 
switch s
    case 1
        [nn,wn]=buttord(2*wp1/Fs,2*ws1/Fs,rp,rs);    
        [b,a] =butter(nn,wn);
        filtered_signal = filter(b,a,x);
    case 2
        [nn,wn]=cheb1ord(2*wp1/Fs,2*ws1/Fs,rp,rs);    
        [b,a] =cheby1(nn,rp,wn,'low'); 
        filtered_signal = filter(b,a,x);
    case 3
        [nn,wn]=cheb2ord(2*wp1/Fs,2*ws1/Fs,rp,rs);  
        [b,a] =cheby2(nn,rs,wn,'low'); 
        filtered_signal = filter(b,a,x);
end
   handles.fx=filtered_signal;
end
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[s,v]=listdlg('PromptString','选择滤波器类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'butter','cheby1','cheby2'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    a=inputdlg({'wp1','ws1','rp','rs'},'设置滤波器参数',1,{'1200','800','1','20'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    rp= str2double(a{3,1});
    rs= str2double(a{4,1}); 
    x=handles.x;
    Fs=handles.Fs;
    N=Fs; 
switch s
    case 1
        [nn,wn]=buttord(2*wp1/Fs,2*ws1/Fs,rp,rs);    
         [b,a] =butter(nn,wn,'high');
        filtered_signal = filter(b,a,x);
    case 2
        [nn,wn]=cheb1ord(2*wp1/Fs,2*ws1/Fs,rp,rs);    
        [b,a] =cheby1(nn,rp,wn,'high'); 
        filtered_signal = filter(b,a,x);
    case 3
        [nn,wn]=cheb2ord(2*wp1/Fs,2*ws1/Fs,rp,rs);  
        [b,a] =cheby2(nn,rs,wn,'high'); 
        filtered_signal = filter(b,a,x);
end
   handles.fx=filtered_signal;
end
guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[s,v]=listdlg('PromptString','选择滤波器类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'butter','cheby1','cheby2'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    a=inputdlg({'wp1','ws1','wp2','ws2','rp','rs'},'设置滤波器参数',1,{'1000','800','1500','1700','1','20'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wp2= str2double(a{3,1});
    ws2= str2double(a{4,1});
    wp=[wp1,wp2];
    ws=[ws1,ws2];
    rp= str2double(a{5,1});
    rs= str2double(a{6,1}); 
    x=handles.x;
    Fs=handles.Fs;
    N=Fs; 
switch s
           case 1                                   
                [nn,wn]=buttord(2*wp/Fs,2*ws/Fs,rp,rs); 
                [b,a] =butter(nn,wn);
                filtered_signal = filter(b,a,x);
           case 2
                [nn,wn]=cheb1ord(2*wp/Fs,2*ws/Fs,rp,rs);
                [b,a] =cheby1(nn,rp,wn); 
                filtered_signal = filter(b,a,x);
           case 3
                [nn,wn]=cheb2ord(2*wp/Fs,2*ws/Fs,rp,rs);
                [b,a] =cheby2(nn,rs,wn); 
                filtered_signal = filter(b,a,x);
end
   handles.fx=filtered_signal;
end
guidata(hObject,handles);

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[s,v]=listdlg('PromptString','选择滤波器类型:',...%提示文件??
'SelectionMode','single',...%单选??
'ListString',{'butter','cheby1','cheby2'},...%列表选项??
'ListSize',[200 100],...%列表框大小默认?[160?300]??
'OKString','继续',...%确定和取消按钮显示的文字??
'CancelString','取消');
if v==1
    a=inputdlg({'wp1','ws1','wp2','ws2','rp','rs'},'设置滤波器参数',1,{'700','1000','1800','1500','1','20'},'on');
    wp1= str2double(a{1,1});
    ws1= str2double(a{2,1});
    wp2= str2double(a{3,1});
    ws2= str2double(a{4,1});
    wp=[wp1,wp2];
    ws=[ws1,ws2];
    rp= str2double(a{5,1});
    rs= str2double(a{6,1}); 
    x=handles.x;
    Fs=handles.Fs;
    N=Fs; 
    switch  s
           case 1                                   
                [nn,wn]=buttord(2*wp/Fs,2*ws/Fs,rp,rs);
                [b,a] =butter(nn,wn,'stop');
                filtered_signal = filter(b,a,x);
           case 2
                [nn,wn]=cheb1ord(2*wp/Fs,2*ws/Fs,rp,rs);
                [b,a] =cheby1(nn,rp,wn,'stop'); 
                filtered_signal = filter(b,a,x);
               
           case 3
                [nn,wn]=cheb2ord(2*wp/Fs,2*ws/Fs,rp,rs);
                [b,a] =cheby2(nn,rs,wn,'stop'); 
                filtered_signal = filter(b,a,x);  
   end
   handles.fx=filtered_signal;
end
guidata(hObject,handles);

% --- Executes when selected object is changed in uipanel3.
function uipanel3_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel3 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

str=get(hObject,'string');
axes(handles.axes5);
cla;
Fs=handles.Fs;
x=handles.fx;
switch str
    case '时域图'
        n=length(x);
        t=1/Fs:1/Fs:n/Fs;
        plot(t,x,'g');
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
        
    case '频域图' 
        s=length(x);
        X = fft(x,s); 
        Pyy = X.* conj(X) / s; 
        h=floor(s/2); 
        f=Fs*(0:h)/s; 
        plot(f,Pyy(1:h+1));xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
    
    case '语谱图'  
        stft(x,128, 128, 0, 32000);
    case '三维时频图'
        stft3d(x,128, 128, 0, 32000);
end;

guidata(hObject,handles);  


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=length(handles.x);  
[yn,W,en]=LMS(handles.nx,handles.x,10,1/(N+1));
handles.fx=yn;
guidata(hObject,handles);
% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function sliderh3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderh3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X3;
global Y3;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh3,'value');
moveV=get(handles.sliderv3,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes5);
cla;
plot(X3,Y3)
shading interp;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderh3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderh3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderv3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X3;
global Y3;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh3,'value');
moveV=get(handles.sliderv3,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes5);
cla;
plot(X3,Y3)
shading interp;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderv3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderv3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_scale3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_scale3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X3;
global Y3;
global showRange;
global MAX_SHOW_RANGE;
global MAX_SCALE_MODULUS;
scale_modulus=(get(handles.slider_scale3,'value'))*(MAX_SCALE_MODULUS-1)+1;
if scale_modulus==1
    setSliderEnable(handles.sliderh3,handles.sliderv3,'off');
else
    setSliderEnable(handles.sliderh3,handles.sliderv3,'on');
end

showRange=getShowRangeByScale(scale_modulus,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
resetMoveSlider(handles.sliderv3,handles.sliderh3,showRange,MAX_SHOW_RANGE);
axes(handles.axes5)
cla;
plot(X3,Y3)
shading interp
axis(showRange);

% --- Executes during object creation, after setting all properties.
function slider_scale3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_scale3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderh2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderh2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X2;
global Y2;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh2,'value');
moveV=get(handles.sliderv2,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes4);
cla;
plot(X2,Y2)
shading interp;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderh2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderh2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderv2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X2;
global Y2;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh2,'value');
moveV=get(handles.sliderv2,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes4);
cla;
plot(X2,Y2)
shading interp;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderv2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderv2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_scale2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X2;
global Y2;
global showRange;
global MAX_SHOW_RANGE;
global MAX_SCALE_MODULUS;
scale_modulus=(get(handles.slider_scale2,'value'))*(MAX_SCALE_MODULUS-1)+1;
if scale_modulus==1
    setSliderEnable(handles.sliderh2,handles.sliderv2,'off');
else
    setSliderEnable(handles.sliderh2,handles.sliderv2,'on');
end

showRange=getShowRangeByScale(scale_modulus,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
resetMoveSlider(handles.sliderv2,handles.sliderh2,showRange,MAX_SHOW_RANGE);
axes(handles.axes4)
cla;
plot(X2,Y2)
shading interp
axis(showRange);

% --- Executes during object creation, after setting all properties.
function slider_scale2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_scale2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderh1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderh1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X1;
global Y1;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh1,'value');
moveV=get(handles.sliderv1,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes3);
str=get(handles.uipane1,'Title');
switch str
    case '时域图'
        plot(X1,Y1)
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
    case '频域图' 
        plot(X1,Y1)
        xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
end;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderh1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderh1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderv1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X1;
global Y1;
global showRange;
global MAX_SHOW_RANGE;
moveH=get(handles.sliderh1,'value');
moveV=get(handles.sliderv1,'value');
showRange=getShowRangeByMove(moveH,moveV,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
axes(handles.axes3);
str=get(handles.uipane1,'Title');
switch str
    case '时域图'
        plot(X1,Y1)
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
    case '频域图' 
        plot(X1,Y1)
        xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
end;
shading interp;
axis(showRange);

% --- Executes during object creation, after setting all properties.
function sliderv1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderv1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_scale1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_scale1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global X1;
global Y1;
global showRange;
global MAX_SHOW_RANGE;
global MAX_SCALE_MODULUS;
scale_modulus=(get(handles.slider_scale1,'value'))*(MAX_SCALE_MODULUS-1)+1;
if scale_modulus==1
    setSliderEnable(handles.sliderh1,handles.sliderv1,'off');
else
    setSliderEnable(handles.sliderh1,handles.sliderv1,'on');
end

showRange=getShowRangeByScale(scale_modulus,showRange,MAX_SHOW_RANGE);
showRange=check_showRange(showRange,MAX_SHOW_RANGE);
resetMoveSlider(handles.sliderv1,handles.sliderh1,showRange,MAX_SHOW_RANGE);
axes(handles.axes3)
str=get(handles.uipane1,'Title');
switch str
    case '时域图'
        plot(X1,Y1)
        xlabel('时间（s）')%x轴标记
        ylabel('幅度')%y轴标记
        title('时域图')%标题
    case '频域图'
        plot(X1,Y1)
        xlabel('频率(Hz)'); 
        ylabel('幅度')%y轴标记
        title('频域图')%标题
end;
shading interp
axis(showRange);


% --- Executes during object creation, after setting all properties.
function slider_scale1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_scale1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hm=myaudioplayer();


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.rA);
guidata(hObject,handles);  

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename1;global pathname1;
outputname=[pathname1,filename1];
[x,Fs]= audioread([outputname,'_A']);
x=x(:,1);
handles.rA=audioplayer(x,Fs);
play(handles.rA);
guidata(hObject,handles);  

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename1;global pathname1;
outputname=[pathname1,filename1];
[x,Fs]= audioread([outputname,'_E']);
x=x(:,1);
handles.rE=audioplayer(x,Fs);
play(handles.rE);
guidata(hObject,handles);  
% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.rE);
guidata(hObject,handles);  


function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_28_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename1;global pathname1;global lambda;
[filename1, pathname1] = uiputfile({'All music Files'}, 'Pick an wav');
a=inputdlg({'lambda'},'设置参数',1,{''},'on');
lambda= str2double(a{1,1});
Z=handles.x;
Fs=handles.Fs;
SVS(Z,Fs,lambda,[pathname1,filename1])


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filenameE;
global pathnameE;
[filenameE, pathnameE] = uigetfile({'*.mp3;*.wav','All music Files';...
'*.*','All Files' });
set(handles.edit15,'string',filenameE);
guidata(hObject,handles);  


function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filenameA;
global pathnameA;
[filenameA, pathnameA] = uigetfile({'*.mp3;*.wav','All music Files';...
'*.*','All Files' });
set(handles.edit16,'string',filenameA);
guidata(hObject,handles);  


function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
