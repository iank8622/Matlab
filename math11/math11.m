clear all;clc;close all;%format short;

%槓
l1 = [0,0];
l2in = 10;
l2 = [0 ,l2in];

%箱
sq1x = [-(l2in/5) ,(l2in/5)];
sq1y = [l2in ,l2in];

sq2x = sq1x;
sq2y = [l2in + (l2in/5)*2 ,l2in + (l2in/5)*2];

sq3x = [-(l2in/5),-(l2in/5)];
sq3y = [l2in ,l2in + (l2in/5)*2];

sq4x = [(l2in/5),(l2in/5)];
sq4y = [l2in ,l2in + (l2in/5)*2];

%頂

t1x = [-(l2in/5) ,0 ,(l2in/5)];
t1y = [l2in + (l2in/5)*2, l2in + (l2in/5)*2.5, l2in + (l2in/5)*2];






figure, hold on;

%槓
plot(l1, l2, 'b', 'LineWidth', 3);

%箱
plot(sq1x, sq1y, 'r', 'LineWidth', 3);
plot(sq2x, sq2y, 'r', 'LineWidth', 3);
plot(sq3x, sq3y, 'r', 'LineWidth', 3);
plot(sq4x, sq4y, 'r', 'LineWidth', 3);

%頂
plot(t1x, t1y, 'r', 'LineWidth', 3);

%複製
%轉換角度
n = 8;
intvl = 2 * pi / n;
%線性轉換矩陣 (順時針)
A = [cos(intvl) sin(intvl);
    -sin(intvl) cos(intvl)];
%依角度轉換值
tmp_l = A * [l1; l2];
tmp_sq1 = A * [sq1x; sq1y];
tmp_sq2 = A * [sq2x; sq2y];
tmp_sq3 = A * [sq3x; sq3y];
tmp_sq4 = A * [sq4x; sq4y];
tmp_t1 = A * [t1x; t1y];
%提取新值
l1_new = tmp_l(1, :);
l2_new = tmp_l(2, :);
sq1x_new = tmp_sq1(1, :);
sq1y_new = tmp_sq1(2, :);
sq2x_new = tmp_sq2(1, :);
sq2y_new = tmp_sq2(2, :);
sq3x_new = tmp_sq3(1, :);
sq3y_new = tmp_sq3(2, :);
sq4x_new = tmp_sq4(1, :);
sq4y_new = tmp_sq4(2, :);
t1x_new = tmp_t1(1, :);
t1y_new = tmp_t1(2, :);

plot(l1_new, l2_new, 'b', 'LineWidth', 3);
plot(sq1x_new, sq1y_new, 'r', 'LineWidth', 3);
plot(sq2x_new, sq2y_new, 'r', 'LineWidth', 3);
plot(sq3x_new, sq3y_new, 'r', 'LineWidth', 3);
plot(sq4x_new, sq4y_new, 'r', 'LineWidth', 3);
plot(t1x_new, t1y_new, 'r', 'LineWidth', 3);







axis equal;
hold off;


%for i=1:m %C語言會算尾數


hold off

return

x=(rand(1,30)-0.5)*10;
%rand(1列30個隨機元素)
%rand*10=+-5之間
%x belong(屬於) to -5 ~ 5
y=50.*rand(1,30).*x;
plot(x,y)