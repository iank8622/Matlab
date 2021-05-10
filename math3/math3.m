clear all;
clc;
close all;
%關所有的圖

x = 1:50;
x2 = [343,1423,3423,54,231,43,554];
%亦可寫做x2 = [343 1423 3423 54 231 43 554];
score = [23,45,69,13,67,22,100];
figure(1),plot(x2,score,'r','MarkerSize',20);
title('排序前');
[x3,I] = sort(x2);
figure(2),plot(x3,score,'r','MarkerSize',20);
title('排序後');


f = @(x) exp(-x^2); 
%指數 ^為次方 此為f(x)=e(-x^2)程式碼
k = 0;
%當作slope之索引值
for i = 2:1:10
    %i至x為繪製x點
    k = k+1;
    h = 10^(-i);
    %h盡量小 趨近於0
    delta_y = f(2+h)-f(2);
    %delta_y=f(x+h)-f(x)=f(2+h)-f(2)
    delta_x = h;
    slope(k) = delta_y/delta_x;
    %斜率計算
end
figure,plot(2:1:10,slope)

im = imread('math3.jpg');
%im宣告為圖檔
bw = im;
%bw(:,:) = im(:,:,1);
%將三維陣列降至二維
bw(im==255) = 1;
%將im中的255用==取代為黑色的1色號
figure,imshow(uint8(bw));
%imshow(uint8(bw))顯示圖片檔並強制轉換為8位元類別


