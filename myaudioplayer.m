function varargout = myaudioplayer(varargin)
%这是主GUI的一个子GUI，主要功能：实时频谱播放，频谱均衡等
% MYAUDIOPLAYER M-file for myaudioplayer.fig
%      MYAUDIOPLAYER, by itself, creates a new MYAUDIOPLAYER or raises the existing
%      singleton*.
%
%      H = MYAUDIOPLAYER returns the handle to a new MYAUDIOPLAYER or the handle to
%      the existing singleton*.
%
%      MYAUDIOPLAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYAUDIOPLAYER.M with the given input arguments.
%
%      MYAUDIOPLAYER('Property','Value',...) creates a new MYAUDIOPLAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myaudioplayer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myaudioplayer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myaudioplayer

% Last Modified by GUIDE v2.5 25-May-2017 22:05:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myaudioplayer_OpeningFcn, ...
                   'gui_OutputFcn',  @myaudioplayer_OutputFcn, ...
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


% --- Executes just before myaudioplayer is made visible.


% UIWAIT makes myaudioplayer wait for user response (see UIRESUME)
% uiwait(handles.figure_myaudioplayer);


% --- Outputs from this function are returned to the command line.
function varargout = myaudioplayer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_load.
function button_load_Callback(hObject, eventdata, handles)
% hObject    handle to button_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.timer1);
global n i stop1 x y fs  C w fpath MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4  MyIrc5 i N step w1 w2 w3 w4 w5 a b;
n=1;i=1;
[filename, pathname] = uigetfile( ...
       {'*.wav', 'All Image Files (*.wav)'; ...
        '*.*',                   'All Files (*.*)'}, ...
        'Pick a wave');
if isequal(filename,0) || isequal(pathname,0),
return;
end
fpath=[pathname filename];
if (strcmp(filename,'容祖儿-小小.wav'))
    MyIrc=MyIrc1;
elseif (strcmp(filename,'Lilei&Hanmeimei.wav'))
    MyIrc=MyIrc2;
elseif(strcmp(filename,'黄晓明-风声.wav'))
    MyIrc=MyIrc3;
elseif (strcmp(filename,'曾轶可-最天使.wav'))
    MyIrc=MyIrc4;
else 
    MyIrc=MyIrc5;
end
[M,N]=size(MyIrc);
[y,fs]=wavread(fpath);
 w1=filter(10^(C(1)/20)*b{1},a{1},y);
 w2=filter(10^(C(2)/20)*b{2},a{2},y);
 w3=filter(10^(C(3)/20)*b{3},a{3},y);
 w4=filter(10^(C(4)/20)*b{4},a{4},y);
 w5=filter(10^(C(5)/20)*b{5},a{5},y);
 w=w1+w2+w3+w4+w5;
% w=y;
x=audioplayer(y,fs);
stop1=0;
Max=length(y);
setappdata(handles.figure_myaudioplayer,'Max',Max);
setappdata(handles.figure_myaudioplayer,'fpath',fpath);
set(handles.jindu_var,'max',100);
str=ConvTime(fix(x.TotalSamples/fs));
set(handles.text_end,'string',str);
step=fix(x.TotalSamples/fs/4);
Info= strcat('正在播放:   ',filename);
set(handles.text_info,'string',Info);
guidata(hObject,handles); 



% --- Executes on button press in button_play.
function button_play_Callback(hObject, eventdata, handles)
% hObject    handle to button_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x  y w fs fpath stop1 C a b i ;i=1;
    Vol=str2num(get(handles.vol_val,'string'));
    x=audioplayer(Vol.*w,fs);
    play(x);
    stop1=0;
    start(handles.timer1);

% --- Executes on button press in button_pause.
function button_pause_Callback(hObject, eventdata, handles)
% hObject    handle to button_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  stop1 x ;
     stop1=1;
     pause(x);
guidata(hObject,handles); 


% --- Executes on button press in button_continue.
function button_continue_Callback(hObject, eventdata, handles)
% hObject    handle to button_continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global  stop1 x ;
    stop1=0;
    resume(x);

% --- Executes on button press in button_stop.
function button_stop_Callback(hObject, eventdata, handles)
% hObject    handle to button_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
stop(x);
stop(handles.timer1);

% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
% hObject    handle to button_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C w y x fs;
Vol=str2num(get(handles.vol_val,'string'));
C=zeros(1,5);
set(handles.C1_val,'string',num2str(0));
set(handles.C2_val,'string',num2str(0));
set(handles.C3_val,'string',num2str(0));
set(handles.C4_val,'string',num2str(0));
set(handles.C5_val,'string',num2str(0));

set(handles.C1_var,'value',0);
set(handles.C2_var,'value',0);
set(handles.C3_var,'value',0);
set(handles.C4_var,'value',0);
set(handles.C5_var,'value',0);
axes(handles.axes3);
equalizer_plot();
w=y;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(Vol.*w,fs);
play(x,Cul);



function PlotUpdate(obj,events,handles)
global n w stop1 x  fs  MyIrc i N t frequencies step  color1 color2;
str=ConvTime(fix(x.CurrentSample/fs));
set(handles.text_time,'string',str);
if (stop1==0)
    if(isplaying(x))
        t=x.CurrentSample/x.TotalSamples;
        set(handles.jindu_var,'value',100*t)
 Vol=str2num(get(handles.vol_val,'string'));
 Max=getappdata(handles.figure_myaudioplayer,'Max');
 fpath=getappdata(handles.figure_myaudioplayer,'fpath');
if 1100*n<Max 
    m=w(1100*(n-1)+1:1100*n); 
    M=abs(fft(m));
for s=1:32
    Z(s)=mean(M((s-1)*15+1:s*15));
end
axes(handles.axes1);
h1=bar(Z,color1);
axis off;box off;
set(h1,'ButtonDownFcn',{@Changecolor, 1});%%%
%   set(gca,'xticklabel',sprintf('%s|', frequencies{1:24}));
ylim([0 10]);
 axes(handles.axes2);
 h2=plot(m,color2);
 axis off;box off;
 set(h2,'ButtonDownFcn',{@Changecolor, 2})
 axis([0 1100 -1 1]);
end
if (i==1)
    Str1 = MyIrc{1};
    Str2 = MyIrc{2};
    Str3 = MyIrc{3};
    Str4 = MyIrc{4};
    Str5 = MyIrc{5};
    Str6 = MyIrc{6};
    Str7 = MyIrc{7};
    Str8= MyIrc{8};
    Str9 = MyIrc{9};
    Str10 = MyIrc{10};
    TemStr = strvcat(Str1,Str2, Str3, Str4, Str5,Str6,Str7,Str8,Str9,Str10);
    set(handles.text7, 'String', TemStr);
end
n=n+1;
        if (i<=(N-10))
             if (mod(n,step)==0)
                    Str1 = MyIrc{i+1};
                    Str2 = MyIrc{i+2};
                    Str3 = MyIrc{i+3};
                    Str4 = MyIrc{i+4};
                    Str5 = MyIrc{i+5};
                    Str6 = MyIrc{i+6};
                    Str7 = MyIrc{i+7};
                    Str8= MyIrc{i+8};
                    Str9 = MyIrc{i+9};
                    Str10 = MyIrc{i+10};
                    TemStr = strvcat(Str1,Str2, Str3, Str4, Str5,Str6,Str7,Str8,Str9,Str10);
                    set(handles.text7, 'String', TemStr);
                    i=i+1;
             end
        else
                    Str1 = MyIrc{N-9};
                    Str2 = MyIrc{N-8};
                    Str3 = MyIrc{N-7};
                    Str4 = MyIrc{N-6};
                    Str5 = MyIrc{N-5};
                    Str6 = MyIrc{N-4};
                    Str7 = MyIrc{N-3};
                    Str8= MyIrc{N-2};
                    Str9 = MyIrc{N-1};
                    Str10 = MyIrc{N};
                    TemStr = strvcat(Str1,Str2, Str3, Str4, Str5,Str6,Str7,Str8,Str9,Str10);
                    set(handles.text7, 'String', TemStr);
        end
    
    end
end




% --- Executes on slider movement.
function vol_var_Callback(hObject, eventdata, handles)
% hObject    handle to vol_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
global  x y w fs ;
set(handles.vol_val,'string',num2str(get(hObject,'value')));
Vol=str2num(get(handles.vol_val,'string'));
Cul=x.CurrentSample;
stop(x);
x=audioplayer(Vol.*w,fs);
play(x,Cul);



% --- Executes during object creation, after setting all properties.
function vol_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vol_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[0 .749 .749]);
end

% --- Executes on slider movement.
function jindu_var_Callback(hObject, eventdata, handles)
% hObject    handle to jindu_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global x n i N;
duty=get(hObject,'value');
Setting=x.TotalSamples*duty/100;
Cul=x.CurrentSample;
stop(x);
play(x,Setting);
n=fix(Setting/1100);
i=fix(duty/100*N)


% --- Executes during object creation, after setting all properties.
function jindu_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jindu_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end



% --- Executes on slider movement.
function C1_var_Callback(hObject, eventdata, handles)
% hObject    handle to C1_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider
global  y C w1 w w2 w3 w4 w5 a b x fs;
C(1)=get(hObject,'value');
set(handles.C1_val,'string',num2str(C(1)));
axes(handles.axes3);
equalizer_plot();
w1=filter(10^(C(1)/20)*b{1},a{1},y);
w=w1+w2+w3+w4+w5;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(w,fs);
play(x,Cul);




% --- Executes during object creation, after setting all properties.
function C1_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end



% --- Executes on slider movement.
function C2_var_Callback(hObject, eventdata, handles)
% hObject    handle to C2_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C w1 w w2 w3 w4 w5 a b y x fs;
C(2)=get(hObject,'value');
set(handles.C2_val,'string',num2str(C(2)));
axes(handles.axes3);
equalizer_plot();
w2=filter(10^(C(2)/20)*b{2},a{2},y);
w=w1+w2+w3+w4+w5;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(w,fs);
play(x,Cul);

% --- Executes during object creation, after setting all properties.
function C2_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end




% --- Executes on slider movement.
function C3_var_Callback(hObject, eventdata, handles)
% hObject    handle to C3_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C w1 w w2 w3 w4 w5 a b y x fs;
C(3)=get(hObject,'value');
set(handles.C3_val,'string',num2str(C(3)));
axes(handles.axes3);
equalizer_plot();
w3=filter(10^(C(3)/20)*b{3},a{3},y);
w=w1+w2+w3+w4+w5;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(w,fs);
play(x,Cul);

% --- Executes during object creation, after setting all properties.
function C3_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C3_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end



% --- Executes on slider movement.
function C4_var_Callback(hObject, eventdata, handles)
% hObject    handle to C4_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C w1 w w2 w3 w4 w5 a b y x fs;
C(4)=get(hObject,'value');
set(handles.C4_val,'string',num2str(C(4)));
axes(handles.axes3);
equalizer_plot();
w4=filter(10^(C(4)/20)*b{4},a{4},y);
w=w1+w2+w3+w4+w5;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(w,fs);
play(x,Cul);

% --- Executes during object creation, after setting all properties.
function C4_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C4_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end



% --- Executes on slider movement.
function C5_var_Callback(hObject, eventdata, handles)
% hObject    handle to C5_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global C w1 w w2 w3 w4 w5 a b y x fs;
C(5)=get(hObject,'value');
set(handles.C5_val,'string',num2str(C(5)));
axes(handles.axes3);
equalizer_plot();
w5=filter(10^(C(5)/20)*b{5},a{5},y);
w=w1+w2+w3+w4+w5;
Cul=x.CurrentSample;
stop(x);
x=audioplayer(w,fs);
play(x,Cul);

% --- Executes during object creation, after setting all properties.
function C5_var_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C5_var (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.502 .502 .502]);
end


function vol_val_Callback(hObject, eventdata, handles)
% hObject    handle to vol_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vol_val as text
%        str2double(get(hObject,'String')) returns contents of vol_val as a
%        double
val=str2num(get(hObject,'string'));
minn=get(handles.vol_var,'min');
maxx=get(handles.vol_var,'max');
if(val<minn || val>maxx)
    val=get(handles.vol_var,'value');
    set(hObject,'string',num2str(1));
else
    set(handles.vol_var,'value',val);
end

% --- Executes during object creation, after setting all properties.
function vol_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vol_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C1_val_Callback(hObject, eventdata, handles)
% hObject    handle to C1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C;
C(1)=str2num(get(hObject,'string'));
minn=get(handles.C1_var,'min');
maxx=get(handles.C1_var,'max');
if(C(1)<minn || C(1)>maxx)
    C(1)=get(handles.C1_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C1_var,'value',C(1));
end
% Hints: get(hObject,'String') returns contents of C1_val as text
%        str2double(get(hObject,'String')) returns contents of C1_val as a double


% --- Executes during object creation, after setting all properties.
function C1_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C2_val_Callback(hObject, eventdata, handles)
% hObject    handle to C2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C2_val as text
%        str2double(get(hObject,'String')) returns contents of C2_val as a double
global C;
C(2)=str2num(get(hObject,'string'));
minn=get(handles.C2_var,'min');
maxx=get(handles.C2_var,'max');
if(C(2)<minn || C(2)>maxx)
    C(2)=get(handles.C2_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C2_var,'value',C(2));
end

% --- Executes during object creation, after setting all properties.
function C2_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C3_val_Callback(hObject, eventdata, handles)
% hObject    handle to C3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C3_val as text
%        str2double(get(hObject,'String')) returns contents of C3_val as a double
global C;
C(3)=str2num(get(hObject,'string'));
minn=get(handles.C3_var,'min');
maxx=get(handles.C3_var,'max');
if(C(3)<minn || C(3)>maxx)
    C(3)=get(handles.C3_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C3_var,'value',C(3));
end

% --- Executes during object creation, after setting all properties.
function C3_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C4_val_Callback(hObject, eventdata, handles)
% hObject    handle to C4_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C4_val as text
%        str2double(get(hObject,'String')) returns contents of C4_val as a double
global C;
C(4)=str2num(get(hObject,'string'));
minn=get(handles.C4_var,'min');
maxx=get(handles.C4_var,'max');
if(C(4)<minn || C(4)>maxx)
    C(4)=get(handles.C4_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C4_var,'value',C(4));
end

% --- Executes during object creation, after setting all properties.
function C4_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C4_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C5_val_Callback(hObject, eventdata, handles)
% hObject    handle to C5_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C5_val as text
%        str2double(get(hObject,'String')) returns contents of C5_val as a double
global C;
C(5)=str2num(get(hObject,'string'));
minn=get(handles.C5_var,'min');
maxx=get(handles.C5_var,'max');
if(C(5)<minn || C(5)>maxx)
    C(5)=get(handles.C5_var,'value');
    set(hObject,'string',num2str(0));
else
    set(handles.C5_var,'value',C(5));
end

% --- Executes during object creation, after setting all properties.
function C5_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C5_val (see GCBO)
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

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
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


function str=ConvTime(sec)
a=fix(sec/60);
b=mod(sec,60);
if b<10
str=strcat('0',num2str(a),':','0',num2str(b));
else
str=strcat('0',num2str(a),':',num2str(b));
end

function Changecolor(varargin)
global  color1 color2 n colorOrder1;

  switch varargin{3}     
      case 1
          color1=colorOrder1(mod(n,8)+1);
      case 2
          color2=colorOrder1(mod(n,8)+1);
  end

function myaudioplayer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myaudioplayer (see VARARGIN)

% Choose default command line output for myaudioplayer
handles.output = hObject;
handles.output = hObject;
setappdata(handles.figure_myaudioplayer,'Max',0);
setappdata(handles.figure_myaudioplayer,'fpath',0);
set(handles.figure_myaudioplayer,'defaultAxesColor',[0.4 0.5 0.7])
handles.timer1= timer('Period',0.01,'ExecutionMode','FixedRate','TimerFcn',{@PlotUpdate,handles});
% handles.timer2= timer('ExecutionMode','singleShot','TimerFcn',{@Play,handles});
% Update handles structure
guidata(hObject, handles);
global n stop1  x y fs C Cul w fpath MyIrc  i  m a b  MyIrc MyIrc1 MyIrc2 MyIrc3 MyIrc4 MyIrc5 color1 color2 colorOrder1 ;
n=10;m=0;color1='b';color2='c';
stop1=0;i=1;
C=zeros(1,5);
fs=11025;
[a,b]=coef();
colorOrder1 = ['r';'g'; 'b';'c';'m';'y';'k';'w'];

set(handles.vol_var,'min',0);
set(handles.vol_var,'max',5);
set(handles.vol_var,'value',1);
set(handles.vol_var,'SliderStep',[0.1,0.1]);
set(handles.vol_val,'string',num2str(1));
set(handles.C1_var,'min',-20);
set(handles.C1_var,'max',20);
set(handles.C1_var,'value',0);
set(handles.C1_var,'SliderStep',[0.025,0.05]);
set(handles.C1_val,'string',num2str(0));

set(handles.C2_var,'min',-20);
set(handles.C2_var,'max',20);
set(handles.C2_var,'value',0);
set(handles.C2_var,'SliderStep',[0.025,0.05]);
set(handles.C2_val,'string',num2str(0));

set(handles.C3_var,'min',-20);
set(handles.C3_var,'max',20);
set(handles.C3_var,'value',0);
set(handles.C3_var,'SliderStep',[0.025,0.05]);
set(handles.C3_val,'string',num2str(0));

set(handles.C4_var,'min',-20);
set(handles.C4_var,'max',20);
set(handles.C4_var,'value',0);
set(handles.C4_var,'SliderStep',[0.025,0.05]);
set(handles.C4_val,'string',num2str(0));

set(handles.C5_var,'min',-20);
set(handles.C5_var,'max',20);
set(handles.C5_var,'value',0);
set(handles.C5_var,'SliderStep',[0.025,0.05]);
set(handles.C5_val,'string',num2str(0));
set(handles.jindu_var,'min',0);
set(handles.jindu_var,'max',100);
axes(handles.axes3);
equalizer_plot();

MyIrc1={' ',' ',' ','容祖儿-小小',...
'作曲:周杰伦作词:方文山',...
'演唱:容祖儿',' ',' ',' ',' ',' ',...
'回忆像个说书的人',...
'用充满乡音的口吻',...
'跳过水坑绕过小村',...
'等相遇的缘分',...
'你用泥巴捏一座城',...
'说将来要娶我过门',...
'转多少身过几次门',...
'虚掷青春',...
'小小的誓言还不稳',...
'小小的泪水还在撑',...
'稚嫩的唇在说离分',...
'小小的感动雨纷纷',...
'小小的别扭惹人疼',...
'小小的人还不会吻',...
'我的心里从此住了一个人',...
'曾经模样小小的我们',...
'那年你搬小小的板凳',...
'为戏入迷我也一路跟',...
'我在找那个故事里的人',...
'你是不能缺少的部分',...
'你在树下小小的打盹',...
'小小的我傻傻等'};
MyIrc2={' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
    ' ',...
'徐誉滕-lilei&hanmeimei',...
'词曲:徐誉滕',...
' ',...
' ',' ',' ',' ',' ',...
'一切从那本英语书开始的',...
'那书中的男孩lilei',...
'身边的女孩名叫hanmeimei',...
'还有jimlily和lucy',...
'kitelintao和unclewang',...
'一只会说话的鹦鹉叫polly他到处飞',...
' ',...
'好多年没有再一次翻开它',...
'但那一段说的谁和谁',...
'偶尔还能细细回味',...
'书中他们的喜与悲',...
'书外身后的是与非',...
'还有隐隐约约和我',...
'一起长大的小暧昧',...
'后来听说lilei和hanmeimei',...
'谁也未能牵着谁的手',...
'lucy回国lily去了上海',...
'身边还有了那么多男朋友',...
'jim做了汽车公司经理',...
'娶了中国太太衣食无忧',...
'litao当了警察',...
'unclewang他去年退了休'};

MyIrc3={' ',' ',' ',' ',' ',' ',' ','黄晓明-风声',...
'作词:李焯雄作曲:曹轩宾',' ',' ',' ',' ',' '...
'若你看出我那无形的伤痕',...
'你该懂我不光是好胜',...
'亦邪亦正我会是谁的替身',...
'真作假时假当真',...
'说来遗憾就算我有多坚忍',...
'若有似无有什么凭证',...
'半喜半悲爱本来是两面刃',...
'是非由他们议论',...
'没半点风声命运却留下指纹',...
'爱你却不能过问',...
'别走漏风声爱我比敌对残忍',...
'灿烂却是近黄昏'};
MyIrc4={' ',' ',' ',' ',' ','最天使',' ',...
'演唱:曾轶可',' ',' ',...
'最好的那个天使',...
'我最熟悉的字是你的名字',...
'我们会有大大的房子',...
'你会送我一首小诗',...
'最坏的那个天使',...
'我最爱画的就是你的样子',...
'我们守着距离拉成的相思',...
'温柔着彼此的言辞',...
'我最爱的那个天使',...
'爱到可以去死',...
'爱到整个世界',...
'灯全熄灭',...
'最后还要给你体贴',...
'我最恨的就是那个天使',...
'恨到可以去死',...
'恨到快把自己的全部忘记',...
'最后还要刺青铭记',' ',' ',...
'最恨你那么久都不来见我一次',...
'最爱你当远处传来你的相思',...
'最容易想起最难忘记',...
'最想要得到最害怕失去',...
'最初的陪伴最后的需要',...
'最远的距离最近的心跳',...
'最后我说了我恨你',...
'可是我恨你就是我爱你'};

MyIrc5={' ',' ',' ',' ',' ','没有找到相应的歌词',' ',' ',' ',' ',' '};
% Update handles structure
guidata(hObject, handles);


function [a,b]=coef()
global fs;
Fs=fs;
%Filtrul 1
Rp1=1;
Rs1=20;
Fp1=4.1e3/Fs/2;                     
Fs1=4.5e3/Fs/2;                     
n1=cheb1ord(Fp1,Fs1,Rp1,Rs1);
[b1,a1]=cheby1(n1,Rp1,Fp1,'low');
%Filtrul 2
Rp2=1;
Rs2=20;
Fp2=1e3*[4.25,8.75]/Fs/2;                   
Fs2=1e3*[3.9,9.35]/Fs/2;
n2=cheb1ord(Fp2,Fs2,Rp2,Rs2);
[b2,a2]=cheby1(n2,Rp2,Fp2);
%Filtrul 3
Rp3=1;
Rs3=20;
Fp3=1e3*[8.95,13.25]/Fs/2;                   
Fs3=1e3*[8.35,13.65]/Fs/2;
n3=cheb1ord(Fp3,Fs3,Rp3,Rs3);
[b3,a3]=cheby1(n3,Rp3,Fp3);
%Filtrul 4
Rp4=1;
Rs4=20;
Fp4=1e3*[13.4,16.8]/Fs/2;
Fs4=1e3*[13,17.5]/Fs/2;
n4=cheb1ord(Fp4,Fs4,Rp4,Rs4);
[b4,a4]=cheby1(n4,Rp4,Fp4);
%Filtrul 5
Rp5=1;
Rs5=20;
Fp5=1e3*17/Fs/2;                  
Fs5=1e3*17.4/Fs/2;
n5=cheb1ord(Fp4,Fs4,Rp4,Rs4);
[b5,a5]=cheby1(n5,Rp5,Fp5,'high');
a={a1,a2,a3,a4,a5};
b={b1,b2,b3,b4,b5};

function equalizer_plot()
global C fs;
[a,b]=coef();
H=0;
for i=1:5
    H=H+10^(C(i)/20)*abs(freqz(b{i},a{i},1024));
end
plot(1e-3*fs*[0:1023]/2048,20*log10(H));
xlabel('Frequency [kHz]');
ylabel('Magnitude [dB]');
title('EQ Display');
axis([0 1e-3*fs/2 -21 21]);
grid off;box off;
