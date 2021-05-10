clear all;clc;close all; %format long

k=0;
%for迴圈索引值
y=0;
x=-10:0.7:10;
%同 x=linspace(-10,10,1000);
%在-10到10之中切出1000點

for i=1:2:7
    %k=k+1;
y=y+(4./pi).*sin(i.*x)./i;  % (+sin(3.*x)./3+...)項數
%無限級數的函數運算
end



figure,plot(x,y);
xlabel('x');
ylabel('y');

return

x=-7:0.5:7;
p=[-1.3,1,3,5];
y=polyval(p,x);
%同 y=-1.3*x.^3+x.^2+3.*x+5;
pts=length(x)
%觀測x矩陣總數
figure,plot(x,y)
%繪圖
xlabel=('x');
ylabel=('y');

return

%A=[1,2;3,4]
%A[1,2
%  3 4]
A=[1 2
    3 4] %element,pixel value
B=[5,6
   7,8];
%C=A+B
A11=A(1,1); %列,行(欄)
A12=A(1,2);

%C=A*B;
%D=A.*B;

C=zeros(2,2)
%創造一個元素皆為0的2*2矩陣
C(1,1)=A(1,1)*B(1,1)+A(1,2)*B(2,1)
%在矩陣中(1,1)的位置定義其數值
