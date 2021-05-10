clear all;clc;close;format long;
rgb=imread('map.png');
rgb_s=size(rgb);
rgb_l=length(rgb_s); %3D/三維
im=im2bw(rgb);
im_s=size(im) %2D/二維
im_l=length(im_s)


[yo,xo]=find(im==1);
figure,plot(1:length(xo),xo,'b.',1:length(yo),yo,'r.')

figure,imshow(im);
hold on;
plot(xo,yo,'w.');
xlabel('x');
ylabel('y');

px=polyfit(1:length(xo),xo,3); %多項式函數的係數(擬合 curve fitting)
px1=polyder(px);
px2=polyder(px1);
xop=fix(polyval(px,1:length(xo))); %fix指令為強制去小數變整數
xop1=fix(polyval(px1,1:length(xo)));
xop2=fix(polyval(px2,1:length(xo)));

py=polyfit(1:length(yo),yo,3);
py1=polyder(py);
py2=polyder(py1);
yop=fix(polyval(py,1:length(yo)));
yop1=fix(polyval(py1,1:length(yo)));
yop2=fix(polyval(py2,1:length(yo)));


figure,plot(1:length(xop),xop,'b',1:length(xop1),xop1,'r',1:length(xop2),xop2,'g');
legend('gps','vel','acc');
title('x');
figure,plot(1:length(yop),yop,'b',1:length(yop1),yop1,'r',1:length(yop2),yop2,'g');
legend('gps','vel','acc');
title('y');

black=zeros(1000,1000,3);
for i=1:length(xop)
    black(yop(i),xop(i),:)=255;
end

figure,imshow(black);
hold on;
plot(xop,yop);
xlabel('x');
ylabel('y');

imwrite(black,'black2.png');
