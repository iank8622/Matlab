clear all;clc;close all;%format short;

figure, hold on

x=[-5,5];
m=50;

%for i=1:m %C語言會算尾數
for i = [0.1 0.3 0.7 0.9 1:20]
    y=i*x;
    plot(x,y);
    pause(0.1); %暫停(秒數) 以造成動畫效果
end

hold off

x=(rand(1,30)-0.5)*10; 
%rand(1列30個隨機元素)
%rand*10=+-5之間
%x belong(屬於) to -5 ~ 5
y=50.*rand(1,30).*x;
plot(x,y)