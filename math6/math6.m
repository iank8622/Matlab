clear all;clc;close all;format short;

x1=randn(1,5)
delta=8-3;
x2=fix(rand(1,5)*delta*1.2+3)

%-5~5 寫法
delta2=5-(-5);
x3=fix(rand(1,5)*delta2-5)

%計算樣本平均數
N=5;
mu=x2(1)+x2(2)+x2(3)+x2(4)+x2(5)/N
%另種寫法
N=length(x2)
mu2=sum(x2)/N
%簡式
mux=mean(x2)

%取鄰近元素間之差(僅正)
x4=sort(x2)

%取鄰近元素間之差(有負)
dx4=diff(x4)
dx2=diff(x2)

%計算樣本變異術(從元素之差計算)
%將樣本與樣本平均數相減為樣本變異數

S=sqrt((1/(N-1)))*sum((x2-mux).^2)
z=(x2-mux)/S

xz1=zscore([1,2,3,4,]);
xz2=zscore([10,20,30,40,]);
z1=zscore(x1);
z2=zscore(x2);

xx=[xx1,xx2];
zz=[zz1,zz2];

