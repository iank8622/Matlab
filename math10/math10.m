%guide(GUI)開啟使用者元件模組 課本第六章p.120 第十四章
%專題報告打每次心得 內容12大小 中文-標楷體 英文-Times New..
%組員1-8人


function varargout = math10(varargin)
% MATH10 MATLAB code for math10.fig
%      MATH10, by itself, creates a new MATH10 or raises the existing
%      singleton*.
%
%      H = MATH10 returns the handle to a new MATH10 or the handle to
%      the existing singleton*.
%
%      MATH10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATH10.M with the given input arguments.
%
%      MATH10('Property','Value',...) creates a new MATH10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before math10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to math10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help math10

% Last Modified by GUIDE v2.5 23-Nov-2020 16:58:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @math10_OpeningFcn, ...
                   'gui_OutputFcn',  @math10_OutputFcn, ...
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

% --- Executes just before math10 is made visible.
function math10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to math10 (see VARARGIN)

% Choose default command line output for math10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using math10.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes math10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = math10_OutputFcn(hObject, eventdata, handles)
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
axes(handles.axes1);
cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index %下曬選單
    case 1
        plot(rand(5));
    case 2
        plot(sin(1:0.01:25.99));
    case 3
        bar(1:.5:10);
    case 4
        plot(membrane);
    case 5
        %surf(peaks);
        
        axes(handles.axes1);
        cla; %清圖

        fileID = fopen('t_jont.txt','r'); %開啟文件,'r'為讀出參數
        if fileID ~= -1
            A = fscanf(fileID,'%s'); %讀取資料'%s'字串
        end
        fclose(fileID); %關閉文件
        
        B = strsplit(A,','); %將A矩陣中的,切割 整理成B矩陣
        L = fix((length(B)-1)/2); % 這裡少一個()，所以我補上了 by teacher
        %將B矩陣長度-1/2 座標和時間各一筆資料為一組 
        %(405筆-1)/2 共有101個骨架點(影格 三維資料) fix四捨五入整數

        ki = 0; %宣告for迴圈索引值

        %f1 = figure('name','全身','NumberTitle','off'); 
        %將第一參數的圖表名稱設置為第二參數 並將第三參數的NumberTitle關閉
        %v = VideoWriter('skel_record','MPEG-4'); 
        %創建一個影片檔案 第二變數為副檔名 預設生成.avi檔 亦可輸入.mp4等副檔名
        %open(v); %開影片

        for i = 1:2:(L*2) %此處的i索引值為取B矩陣之索引值 2筆一組 跑到上述的(L*2)次為止 (因有BUG故不實作)
%             t = B{i}; %將B矩陣(資料)一索引值(每組第一項)取出元素 賦值予t變數 此為時間參數 此專案未用到
            user_n_joint = B{i+1}; %取上列變數的下一個值
            unj = strsplit(user_n_joint,'_'); %將user_n_joint矩陣中的_切割 此資料為使用者ID
            ki=ki+1; %for迴圈索引值增加 (取代原i無法當真正索引值一事)

%             t2 = strsplit(t,':');
%             t3 = strsplit(t2{1},'-')
            %因非數據之間隔符號過多 故逐一分割成可讀數據

%             t4(ki) = str2num(t3{3}(3:4));
%             t5(ki) = str2num(t2{2});
%             t6(ki) = str2num(t2{3});
%             usr(ki) = str2num(unj{1});
            %將數據轉換型態為num

            kj = 0; Joint = [];
            %宣告kj為2層迴圈索引值與Joint為空向量

            for j = 2:4:length(unj) %第一筆為使用者ID 4個值一組 首項為索引值
                kj = kj+1; %索引值增加
        %未用         jn{ki}(kj) = str2num(unj{j}); %轉換型態為num
        %未用         joint{ki}(kj,:) = [str2num(unj{j+1}), str2num(unj{j+2}), str2num(unj{j+3})]; %每個骨架點的xyz座標+索引值 存101筆
                Joint(kj,:) = [str2num(unj{j+1}), str2num(unj{j+2}), str2num(unj{j+3})]; %每個骨架點的yzx座標 
                %(kj,:) 行(1*3) (:,kj)列(3*1)


            end



            x = Joint(1:32,3); %第三維資料 1:32 1到32取32格骨架點 3為第三個元素
            y = Joint(1:32,1); %第一維資料
            z = -Joint(1:32,2); %第二維資料

            %figure(f1),
            plot3(x, y, z, 'r.', 'MarkerSize',  12); hold on; %繪製3D(三維) 要使用plot3方法
            plot3(x(1:3), y(1:3), z(1:3), 'b', 'MarkerSize', 30);
            plot3(x([1,19]), y([1,19]), z([1,19]), 'b', 'MarkerSize', 30);
            plot3(x([1,23]), y([1,23]), z([1,23]), 'b', 'MarkerSize', 30);
            plot3(x([3,4]), y([3,4]), z([3,4]), 'b', 'MarkerSize', 30);
            plot3(x([3,5]), y([3,5]), z([3,5]), 'b', 'MarkerSize', 30);
            plot3(x([3,12]), y([3,12]), z([3,12]), 'b', 'MarkerSize', 30);
            plot3(x([4,27]), y([4,27]), z([4,27]), 'b', 'MarkerSize', 30);
            plot3(x([5,6]), y([5,6]), z([5,6]), 'b', 'MarkerSize', 30);

            plot3(x(6:9), y(6:9), z(6:9), 'b', 'MarkerSize', 30);
            plot3(x([8,11]), y([8,11]), z([8,11]), 'b', 'MarkerSize', 30);
            plot3(x([9,10]), y([9,10]), z([9,10]), 'b', 'MarkerSize', 30);

            plot3(x(12:16), y(12:16), z(12:16), 'b', 'MarkerSize', 30);
            plot3(x([15,18]), y([15,18]), z([15,18]), 'b', 'MarkerSize', 30);
            plot3(x([16,17]), y([16,17]), z([16,17]), 'b', 'MarkerSize', 30);

            plot3(x(19:22), y(19:22), z(19:22), 'g', 'MarkerSize', 30);
            plot3(x(23:26), y(23:26), z(23:26), 'g', 'MarkerSize', 30);

            plot3(x([27,28]), y([27,28]), z([27,28]), 'b', 'MarkerSize', 30);
            plot3(x([27,29]), y([27,28]), z([27,28]), 'b', 'MarkerSize', 30);
            plot3(x([27,30]), y([27,28]), z([27,28]), 'b', 'MarkerSize', 30);
            plot3(x([27,31]), y([27,28]), z([27,28]), 'b', 'MarkerSize', 30);
            plot3(x([27,32]), y([27,28]), z([27,28]), 'b', 'MarkerSize', 30);

            plot3(x(22), y(22), z(22), 'k+', 'MarkerSize', 15);
            plot3(x(26), y(26), z(26), 'k+', 'MarkerSize', 15);
            plot3(x(6), y(6), z(6), 'k+', 'MarkerSize', 15);
            plot3(x(13), y(13), z(13), 'k+', 'MarkerSize', 15);

            %以上為將以繪製出的關節點再以「線」繪製連接



            xlabel('x'); ylabel('y'); zlabel('z'); %設置x y z軸名稱
            axis equal; %1:1 未失真 
            
            axes(handles.axes1); % 這裡缺了指定原圖框，我補上了 by teacher
            
            cla;
            %hold off; %關閉疊圖
            %M = getframe(gcf); %getframe(gcf)為獲得窗口之圖像 並賦值予M變數
            %writeVideo(v, M); 
            %將第二變數的內容寫入第一變數的影像檔

        end

        %close(v) %將完成的影像檔關閉








end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


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

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});
