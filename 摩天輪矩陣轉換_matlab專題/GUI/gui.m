function varargout = gui(varargin)
%GUI MATLAB code file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to gui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 10-Jan-2021 04:02:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
background=imread('background.jpg');
image(background);
colormap gray
set(ha,'handlevisibility','off','visible','on');
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function speed_slider_Callback(hObject, eventdata, handles)
% hObject    handle to speed_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_value = get(hObject,'Value');
set(handles.speed_text,'String', slider_value);




% --- Executes during object creation, after setting all properties.
function speed_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to bar_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bar_text as text
%        str2double(get(hObject,'String')) returns contents of bar_text as a double


% --- Executes during object creation, after setting all properties.
function bar_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bar_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)

% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of start_button

if get(hObject, 'Value') == 1
    
    if get(handles. checkbox1, 'Value') == 1
        
        axes(handles.axes1);
        cla;


        %Sound
        [y, Fs] = audioread("Matlab1_1_Topic.mp3");
        sound(y, Fs);

        %Btm
        x_btm_tri = [-3.5 0 3.5 -3.5];
        y_btm_tri = [-10 0 -10 -10];

        %Copy.
        m = 8;  %Number of boxes.(GUI)
        d = 2 * pi / m; %Interval(間隔) angle.
        p_box = 7; p_tri = 3; %Set the number of coordinate points.

        A = [cos(d) sin(d); %Set location of other boxes.
            -sin(d) cos(d)]; %線性轉換矩陣 (Clockwise)

        %Reserve space for [baskets(m) * number of coordinates(p)].
        X_box = zeros(m, p_box);Y_box = zeros(m, p_box);
        X_tri = zeros(m, p_tri);Y_tri = zeros(m, p_tri);


        %Circle
        theta=0:0.1:2*pi;
        Circle_r = 7.5;
        Circle1=Circle_r*cos(theta);  
        Circle2=Circle_r*sin(theta);

        %Plot first box.
        X_box(1, :) = [0 0 -1 -1 1 1 0];
        Y_box(1, :) = [0 5 5 7 7 5 5];

        X_tri(1, :) = [-1 0 1];
        Y_tri(1, :) = [7 7.5 7];



        for i = 2 : m
            X_box(i, :) = A(1, :) * [X_box(i-1, :); Y_box(i-1, :)];
            Y_box(i, :) = A(2, :) * [X_box(i-1, :); Y_box(i-1, :)];

            X_tri(i, :) = A(1, :) * [X_tri(i-1, :); Y_tri(i-1, :)];
            Y_tri(i, :) = A(2, :) * [X_tri(i-1, :); Y_tri(i-1, :)];

        end


        plot(X_box', Y_box', 'b', 'LineWidth', 3);
        plot(X_tri', Y_tri', 'b', 'LineWidth', 3);

        axis([-12 12 -12 12]),axis square;
        
        double = get(handles.speed_slider, 'Value');
        n = 200 / double ; %Number of rotations(轉動) once time.
        angle = 2 * pi / n;%Set turn angle.
        B = [cos(angle) sin(angle); 
            -sin(angle) cos(angle)]; %線性轉換矩陣 (Clockwise)

        color = ['m', 'c', 'g'];
        ci = 0;

        times = get(handles.times_edit,'Value'); %(GUI)

        %Start turnig.Every turn "angle" angle.
        for i = 1 : times

            ci = ci + 1;

            for j = 1 : n
                

                hold on;
                axis([-12 12 -12 12]),axis square;


                x_temp_box = B(1, :) * [reshape(X_box', 1, p_box*m);
                    reshape(Y_box', 1, p_box*m)];
                y_temp_box = B(2, :) * [reshape(X_box', 1, p_box*m);
                    reshape(Y_box', 1, p_box*m)];
                x_temp_tri = B(1, :) * [reshape(X_tri', 1, p_tri*m);
                    reshape(Y_tri', 1, p_tri*m)];
                y_temp_tri = B(2, :) * [reshape(X_tri', 1, p_tri*m);
                    reshape(Y_tri', 1, p_tri*m)];


                %New coordinate of x,y.
                x_new_box = reshape(x_temp_box, p_box, m)';
                y_new_box = reshape(y_temp_box, p_box, m)';
                x_new_tri = reshape(x_temp_tri, p_tri, m)';
                y_new_tri = reshape(y_temp_tri, p_tri, m)';

               
                %摩天輪
                plot(x_btm_tri, y_btm_tri, 'b', 'LineWidth', 4);hold on;
                plot(Circle1,Circle2,'r','linewidth',1.5);  
                plot(x_new_box', y_new_box', color(ci), 'LineWidth', 3);
                plot(x_new_tri', y_new_tri', color(ci), 'LineWidth', 3);

                pause(0.01); %Pause seconds(GUI)
                axes(handles.axes1);

                cla;


                X_box = x_new_box; Y_box = y_new_box;
                X_tri = x_new_tri; Y_tri = y_new_tri;


            end


            if ci == 3
                ci = 0;
            end
        end
    end
    
    if get(handles. checkbox1, 'Value') == 0
        
        axes(handles.axes1);
        cla;


        %Sound
        [y, Fs] = audioread("Matlab1_1_Topic.mp3");
        sound(y, Fs);

        %Btm
        x_btm_tri = [-3.5 0 3.5 -3.5];
        y_btm_tri = [-10 0 -10 -10];

        %Copy.
        m = 8;  %Number of boxes.(GUI)
        d = 2 * pi / m; %Interval(間隔) angle.
        p_box = 7; p_tri = 3; %Set the number of coordinate points.

        A = [cos(d) sin(d); %Set location of other boxes.
            -sin(d) cos(d)]; %線性轉換矩陣 (Clockwise)

        %Reserve space for [baskets(m) * number of coordinates(p)].
        X_box = zeros(m, p_box);Y_box = zeros(m, p_box);
        X_tri = zeros(m, p_tri);Y_tri = zeros(m, p_tri);


        %Circle
        theta=0:0.1:2*pi;
        Circle_r = 7.5;
        Circle1=Circle_r*cos(theta);  
        Circle2=Circle_r*sin(theta);

        %Plot first box.
        X_box(1, :) = [0 0 -1 -1 1 1 0];
        Y_box(1, :) = [0 5 5 7 7 5 5];

        X_tri(1, :) = [-1 0 1];
        Y_tri(1, :) = [7 7.5 7];



        for i = 2 : m
            X_box(i, :) = A(1, :) * [X_box(i-1, :); Y_box(i-1, :)];
            Y_box(i, :) = A(2, :) * [X_box(i-1, :); Y_box(i-1, :)];

            X_tri(i, :) = A(1, :) * [X_tri(i-1, :); Y_tri(i-1, :)];
            Y_tri(i, :) = A(2, :) * [X_tri(i-1, :); Y_tri(i-1, :)];

        end


        plot(X_box', Y_box', 'b', 'LineWidth', 3);
        plot(X_tri', Y_tri', 'b', 'LineWidth', 3);


        axis([-12 12 -12 12]),axis square;

        %Car

        x_cars1 = [14 12.5 12.5 13.5 14.5 16.5 17.5 18.5 18.5 17];
        y_cars1 = [-10 -10 -9 -9 -7.5 -7.5 -9 -9 -10 -10];
        x_cars2 = [15 16];
        y_cars2 = [-10 -10];

        x_win1 = [13.8 14.6 15.5 15.5 13.8];
        y_win1 = [-9 -7.8 -7.8 -9 -9];
        x_win2 = [15.7 15.7 16.4 17.2 15.7];
        y_win2 = [-9 -7.8 -7.8 -9 -9];

        wheel_r = 0.5;
        x_wheel1 = [14.5+wheel_r*cos(theta)];
        y_wheel1 = [-10+wheel_r*sin(theta)];
        x_wheel2 = [16.5+wheel_r*cos(theta)];
        y_wheel2 = [-10+wheel_r*sin(theta)];

        p_wheel3 = 2;

        x_wheel3_1_1 = [14 15];
        y_wheel3_1_1 = [-10 -10];
        x_wheel3_1_2 = [14.25 14.75];
        y_wheel3_1_2 = [-9.55 -10.45];
        x_wheel3_1_3 = [14.75 14.25];
        y_wheel3_1_3 = [-9.55 -10.45];

        x_wheel3_2_1 = [16 17];
        y_wheel3_2_1 = [-10 -10];
        x_wheel3_2_2 = [16.25 16.75];
        y_wheel3_2_2 = [-9.55 -10.45];
        x_wheel3_2_3 = [16.75 16.25];
        y_wheel3_2_3 = [-9.55 -10.45];





        double = get(handles.speed_slider, 'Value');
        n = 200 / double ; %Number of rotations(轉動) once time.
        
        angle = 2 * pi / n;%Set turn angle.
        B = [cos(angle) sin(angle); 
            -sin(angle) cos(angle)]; %線性轉換矩陣 (Clockwise)

        color = ['m', 'c', 'g'];
        color_car = ['c', 'g', 'm', 'r'];
        ci = 0;

        times = get(handles.times_edit,'Value');; %(GUI)

        %Start turnig.Every turn "angle" angle.
        for i = 1 : times

            ci = ci + 1;
            ran_car_color1 = randi(4);
            ran_car_color2 = randi(4);
            ran_car_color3 = randi(4);
            ran1 = randi([-3,-2],1);
            ran2 = randi([-1,0],1);
            ran3 = randi([1,2],1);
            fast1 = randi([35,100],1);
            fast2 = randi([200,300],1);
            fast3 = randi([600,1000],1);


            for j = 1 : n
                

                hold on;
                axis([-12 12 -12 12]),axis square;


                x_temp_box = B(1, :) * [reshape(X_box', 1, p_box*m);
                    reshape(Y_box', 1, p_box*m)];
                y_temp_box = B(2, :) * [reshape(X_box', 1, p_box*m);
                    reshape(Y_box', 1, p_box*m)];
                x_temp_tri = B(1, :) * [reshape(X_tri', 1, p_tri*m);
                    reshape(Y_tri', 1, p_tri*m)];
                y_temp_tri = B(2, :) * [reshape(X_tri', 1, p_tri*m);
                    reshape(Y_tri', 1, p_tri*m)];





                %New coordinate of x,y.
                x_new_box = reshape(x_temp_box, p_box, m)';
                y_new_box = reshape(y_temp_box, p_box, m)';
                x_new_tri = reshape(x_temp_tri, p_tri, m)';
                y_new_tri = reshape(y_temp_tri, p_tri, m)';




                %Car1 speed
                x_cars1 = x_cars1 - fast1/n;
                x_cars2 = x_cars2 - fast1/n;

                x_win1 = x_win1 - fast1/n;
                x_win2 = x_win2 - fast1/n;

                x_wheel1 = x_wheel1 - fast1/n;
                x_wheel2 = x_wheel2 - fast1/n;

                x_wheel3_1_1 = x_wheel3_1_1 - fast1/n;
                x_wheel3_1_2 = x_wheel3_1_2 - fast1/n;
                x_wheel3_1_3 = x_wheel3_1_3 - fast1/n;

                x_wheel3_2_1 = x_wheel3_2_1 - fast1/n;
                x_wheel3_2_2 = x_wheel3_2_2 - fast1/n;
                x_wheel3_2_3 = x_wheel3_2_3 - fast1/n;

                %Car2 speed
                x2_cars1 = x_cars1 - fast2/n;
                x2_cars2 = x_cars2 - fast2/n;

                x2_win1 = x_win1 - fast2/n;
                x2_win2 = x_win2 - fast2/n;

                x2_wheel1 = x_wheel1 - fast2/n;
                x2_wheel2 = x_wheel2 - fast2/n;

                x2_wheel3_1_1 = x_wheel3_1_1 - fast2/n;
                x2_wheel3_1_2 = x_wheel3_1_2 - fast2/n;
                x2_wheel3_1_3 = x_wheel3_1_3 - fast2/n;

                x2_wheel3_2_1 = x_wheel3_2_1 - fast2/n;
                x2_wheel3_2_2 = x_wheel3_2_2 - fast2/n;
                x2_wheel3_2_3 = x_wheel3_2_3 - fast2/n;

                %Car3 speed
                x3_cars1 = x_cars1 - fast3/n;
                x3_cars2 = x_cars2 - fast3/n;

                x3_win1 = x_win1 - fast3/n;
                x3_win2 = x_win2 - fast3/n;

                x3_wheel1 = x_wheel1 - fast3/n;
                x3_wheel2 = x_wheel2 - fast3/n;

                x3_wheel3_1_1 = x_wheel3_1_1 - fast3/n;
                x3_wheel3_1_2 = x_wheel3_1_2 - fast3/n;
                x3_wheel3_1_3 = x_wheel3_1_3 - fast3/n;

                x3_wheel3_2_1 = x_wheel3_2_1 - fast3/n;
                x3_wheel3_2_2 = x_wheel3_2_2 - fast3/n;
                x3_wheel3_2_3 = x_wheel3_2_3 - fast3/n;






                %摩天輪
                plot(x_btm_tri, y_btm_tri, 'b', 'LineWidth', 4);hold on;
                plot(Circle1,Circle2,'r','linewidth',1.5);  
                plot(x_new_box', y_new_box', color(ci), 'LineWidth', 3);
                plot(x_new_tri', y_new_tri', color(ci), 'LineWidth', 3);

                %Car1
                plot(x_cars1, y_cars1 + ran1, color_car(ran_car_color1), 'LineWidth', 3);
                plot(x_cars2, y_cars2 + ran1, color_car(ran_car_color1), 'LineWidth', 3);

                plot(x_win1, y_win1 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);
                plot(x_win2, y_win2 +ran1, color_car(ran_car_color1), 'LineWidth', 1.5);

                plot(x_wheel1, y_wheel1 + ran1, color_car(ran_car_color1), 'LineWidth', 3);
                plot(x_wheel2, y_wheel2 + ran1, color_car(ran_car_color1), 'LineWidth', 3);

                plot(x_wheel3_1_1, y_wheel3_1_1 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);
                plot(x_wheel3_1_2, y_wheel3_1_2 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);
                plot(x_wheel3_1_3, y_wheel3_1_3 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);

                plot(x_wheel3_2_1, y_wheel3_2_1 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);
                plot(x_wheel3_2_2, y_wheel3_2_2 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);
                plot(x_wheel3_2_3, y_wheel3_2_3 + ran1, color_car(ran_car_color1), 'LineWidth', 1.5);


                %Car2
                plot(x2_cars1, y_cars1 + ran2, color_car(ran_car_color2), 'LineWidth', 3);
                plot(x2_cars2, y_cars2 + ran2, color_car(ran_car_color2), 'LineWidth', 3);

                plot(x2_win1, y_win1 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);
                plot(x2_win2, y_win2 +ran2, color_car(ran_car_color2), 'LineWidth', 1.5);

                plot(x2_wheel1, y_wheel1 + ran2, color_car(ran_car_color2), 'LineWidth', 3);
                plot(x2_wheel2, y_wheel2 + ran2, color_car(ran_car_color2), 'LineWidth', 3);

                plot(x2_wheel3_1_1, y_wheel3_1_1 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);
                plot(x2_wheel3_1_2, y_wheel3_1_2 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);
                plot(x2_wheel3_1_3, y_wheel3_1_3 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);

                plot(x2_wheel3_2_1, y_wheel3_2_1 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);
                plot(x2_wheel3_2_2, y_wheel3_2_2 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);
                plot(x2_wheel3_2_3, y_wheel3_2_3 + ran2, color_car(ran_car_color2), 'LineWidth', 1.5);


                %Car3
                plot(x3_cars1, y_cars1 + ran3, color_car(ran_car_color3), 'LineWidth', 3);
                plot(x3_cars2, y_cars2 + ran3, color_car(ran_car_color3), 'LineWidth', 3);

                plot(x3_win1, y_win1 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);
                plot(x3_win2, y_win2 +ran3, color_car(ran_car_color3), 'LineWidth', 1.5);

                plot(x3_wheel1, y_wheel1 + ran3, color_car(ran_car_color3), 'LineWidth', 3);
                plot(x3_wheel2, y_wheel2 + ran3, color_car(ran_car_color3), 'LineWidth', 3);

                plot(x3_wheel3_1_1, y_wheel3_1_1 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);
                plot(x3_wheel3_1_2, y_wheel3_1_2 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);
                plot(x3_wheel3_1_3, y_wheel3_1_3 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);

                plot(x3_wheel3_2_1, y_wheel3_2_1 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);
                plot(x3_wheel3_2_2, y_wheel3_2_2 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);
                plot(x3_wheel3_2_3, y_wheel3_2_3 + ran3, color_car(ran_car_color3), 'LineWidth', 1.5);




                pause(0.01); %Pause seconds(GUI)
                axes(handles.axes1);

                cla;



                X_box = x_new_box; Y_box = y_new_box;
                X_tri = x_new_tri; Y_tri = y_new_tri;


            end


            x_cars1 = [14 12.5 12.5 13.5 14.5 16.5 17.5 18.5 18.5 17];
            x2_cars1 = [14 12.5 12.5 13.5 14.5 16.5 17.5 18.5 18.5 17];
            x3_cars1 = [14 12.5 12.5 13.5 14.5 16.5 17.5 18.5 18.5 17];
            x4_cars1 = [14 12.5 12.5 13.5 14.5 16.5 17.5 18.5 18.5 17];
            y_cars1 = [-10 -10 -9 -9 -7.5 -7.5 -9 -9 -10 -10];
            x_cars2 = [15 16];
            x2_cars2 = [15 16];
            x3_cars2 = [15 16];
            x4_cars2 = [15 16];
            y_cars2 = [-10 -10];

            x_win1 = [13.8 14.6 15.5 15.5 13.8];
            x2_win1 = [13.8 14.6 15.5 15.5 13.8];
            x3_win1 = [13.8 14.6 15.5 15.5 13.8];
            x4_win1 = [13.8 14.6 15.5 15.5 13.8];
            y_win1 = [-9 -7.8 -7.8 -9 -9];
            x_win2 = [15.7 15.7 16.4 17.2 15.7];
            x2_win2 = [15.7 15.7 16.4 17.2 15.7];
            x3_win2 = [15.7 15.7 16.4 17.2 15.7];
            x4_win2 = [15.7 15.7 16.4 17.2 15.7];
            y_win2 = [-9 -7.8 -7.8 -9 -9];

            wheel_r = 0.5;
            x_wheel1 = [14.5+wheel_r*cos(theta)];
            x2_wheel1 = [14.5+wheel_r*cos(theta)];
            x3_wheel1 = [14.5+wheel_r*cos(theta)];
            x4_wheel1 = [14.5+wheel_r*cos(theta)];
            y_wheel1 = [-10+wheel_r*sin(theta)];
            x_wheel2 = [16.5+wheel_r*cos(theta)];
            x2_wheel2 = [16.5+wheel_r*cos(theta)];
            x3_wheel2 = [16.5+wheel_r*cos(theta)];
            x4_wheel2 = [16.5+wheel_r*cos(theta)];
            y_wheel2 = [-10+wheel_r*sin(theta)];

            p_wheel3 = 2;

            x_wheel3_1_1 = [14 15];
            x2_wheel3_1_1 = [14 15];
            x3_wheel3_1_1 = [14 15];
            x4_wheel3_1_1 = [14 15];
            y_wheel3_1_1 = [-10 -10];
            x_wheel3_1_2 = [14.25 14.75];
            x2_wheel3_1_2 = [14.25 14.75];
            x3_wheel3_1_2 = [14.25 14.75];
            x4_wheel3_1_2 = [14.25 14.75];
            y_wheel3_1_2 = [-9.55 -10.45];
            x_wheel3_1_3 = [14.75 14.25];
            x2_wheel3_1_3 = [14.75 14.25];
            x3_wheel3_1_3 = [14.75 14.25];
            x4_wheel3_1_3 = [14.75 14.25];
            y_wheel3_1_3 = [-9.55 -10.45];

            x_wheel3_2_1 = [16 17];
            x2_wheel3_2_1 = [16 17];
            x3_wheel3_2_1 = [16 17];
            x4_wheel3_2_1 = [16 17];
            y_wheel3_2_1 = [-10 -10];
            x_wheel3_2_2 = [16.25 16.75];
            x2_wheel3_2_2 = [16.25 16.75];
            x3_wheel3_2_2 = [16.25 16.75];
            x4_wheel3_2_2 = [16.25 16.75];
            y_wheel3_2_2 = [-9.55 -10.45];
            x_wheel3_2_3 = [16.75 16.25];
            x2_wheel3_2_3 = [16.75 16.25];
            x3_wheel3_2_3 = [16.75 16.25];
            x4_wheel3_2_3 = [16.75 16.25];
            y_wheel3_2_3 = [-9.55 -10.45];

            if ci == 3
                ci = 0;
            end
        end
        
    end



end

if get(hObject, 'Value') == 0
    clear sound
end




function speed_edit_Callback(hObject, eventdata, handles)
% hObject    handle to speed_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed_text as text
%        str2double(get(hObject,'String')) returns contents of speed_text as a double


% --- Executes during object creation, after setting all properties.
function speed_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over start_button.
function start_button_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes1 background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function times_edit_Callback(hObject, eventdata, handles)
% hObject    handle to times_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of times_edit as text
%        str2double(get(hObject,'String')) returns contents of times_edit as a double
times_edit_value = str2num(get(hObject,'String'));
set(hObject,'Value', times_edit_value);

% --- Executes during object creation, after setting all properties.
function times_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to times_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
