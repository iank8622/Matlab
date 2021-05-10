clear all;clc;close all; %format long

%(1)練習pages 26-27的範例2.2 矩陣運算。

A=[1 2
    3 4]
B=[5,6
   7,8];
C=3

%C=zeros(2,2)
%創造一個元素皆為0的2*2矩陣
%C(1,1)=A(1,1)*B(1,1)+A(1,2)*B(2,1)
%在矩陣中(1,1)的位置定義其數值

count1=A+B
count2=A-B
count3=A*B
count4=A/B
count5=A^C
count6=C*A
count7=A/C
count8=A.*B
count9=A./B
count10=A.^C
count11=A'
count12=B'
count13=(A*B)'
count14=B'*A'

%(2)練習page32的範例2.5多項式的函數計算與作圖(特徵是平滑曲線)。
x=linspace(-1,1,30);
p=[1,-8,16,-2,8];
y=polyval(p,x);

figure,plot(x,y);
xlabel('x');
ylabel('y');

%(3)練習page34的範例2.7無限級數的函數計算與作圖觀察結果得知所發生的現象。

y2=0;
x2=-10:0.5:10;
%x2=linspace(-10,10,1000);
%在-10到10之中切出1000點

for i=1:2:7
    
    y2=y2+(4./pi).*sin(i.*x2)./i;  % (+sin(3.*x2)./3+...)項數
    %無限級數的函數運算
end



figure,plot(x2,y2);
xlabel('x2');
ylabel('y2');
%依圖表結果推估為無限循環之迴圈
