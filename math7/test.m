clear all;clc;close all;%format short;
%相關性理論(精)


T=readtable("1.xlsx");
class1=T.Var1;
class2=T.Var2;
class3=T.Var3;
class4=T.Var4;
class5=T.Var5;
class6=T.Var6;
class7=T.Var7;
len_1=length(class1);

class1(1)=[];
class2(1)=[];
class3(1)=[];
class4(1)=[];
class5(1)=[];
class6(1)=[];
class7(1)=[];
len_1=length(class1);

T2=readtable("31.xlsx");
class31=T2.Var1;
class32=T2.Var2;
class33=T2.Var3;
class34=T2.Var4;
class35=T2.Var5;
class36=T2.Var6;
class37=T2.Var7;
len_31=length(class31);

class31(1)=[];
class32(1)=[];
class33(1)=[];
class34(1)=[];
class35(1)=[];
class36(1)=[];
class37(1)=[];
len_31=length(class31);

x=zscore(class1);
%c=std(x);
%y=c.*zscore(class31)
y=zscore(class31);

r1(1)=corr(x,y);
%r2=corrcoef(x,y)

% figure(1),plot(x,y,'o');hold on;
% axis
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class2);
%c=std(x);
%y=c.*zscore(class32)
y=zscore(class32);

r1(2)=corr(x,y);

% figure(2),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class3);
%c=std(x);
%y=c.*zscore(class33)
y=zscore(class33);
r1(3)=corr(x,y);

% figure(3),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class4);
%c=std(x);
%y=c.*zscore(class34)
y=zscore(class34);
r1(4)=corr(x,y);

% figure(4),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class5);
%c=std(x);
%y=c.*zscore(class35)
y=zscore(class35);
r1(5)=corr(x,y);

% figure(5),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class6);
% c=std(x);
% y=c.*zscore(class36)
y=zscore(class36);
r1(6)=corr(x,y);

% figure(6),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

x=zscore(class7);
%c=std(x);
%y=c.*zscore(class37)
y=zscore(class37);
r1(7)=corr(x,y);

% figure(7),plot(x,y,'o');hold on;
% xlim auto
% ylim auto
% xlabel('x');
% ylabel('y');
% axis([-2 3 -2 3.5])

r1
figure, plot(r1,'o')
axis([0.5 7.5 -0.5 1.5])


