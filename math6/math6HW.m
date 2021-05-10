clear all;clc;close all;%format short;

t=clock
%lenght(1)
%時間指令

year=num2str(t(1))
%將年num轉str
month=num2str(t(2))
day=num2str(t(3))
hour=num2str(t(4))
minute=num2str(t(5))
sec=num2str(t(6))

strcat(year,'',month,'',day,'',hour,'',minute,'',sec);
path_filename=strcat('.\\test\\',tmp,'.xlsx')
writematrix([1,2;3,4])
%寫矩陣



%return

T=readtable("1.xlsx");

class1=T.Var1
len_1=length(class1)

class2=T.Var2;
class3=T.Var3;
class4=T.Var4;
class5=T.Var5;
class6=T.Var6;
class7=T.Var7;

%class1
%len_1=length(class1)

class1(1)=[];
class2(1)=[];
class3(1)=[];
class4(1)=[];
class5(1)=[];
class6(1)=[];
class7(1)=[];
len_1=length(class1);

x=class1;
y=class2;

dx=max(x)-min(x);
dy=max(y)-min(y);

figure,plot(x,y,'bo');hold on;
xlabel('Class1');ylable('Class2');
axis([min(x)-dx*0.01,max(x)+dx*0.01,min(y)-dx*0.1,max(y)+dx*0.1]);
axis equal;