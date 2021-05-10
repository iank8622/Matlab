clear all;clc;close all;%format short;
%相關性理論 原公式證明

X=[1;2;3];
Y=[2;5;6];

p=corr(X,Y,'type','Pearson')

sumXY=X'*Y
sumX=sum(X);
sumX2=sum(X.^2);
sumY=sum(Y);
sumY2=sum(Y.^2);
N=length(X);
a=sumXY-sumX*sumY/N;
b1=sumX2-sumX^2/N;
b2=sumY2-sumY^2/N;

r=a/sqrt(b1*b2)

arr=corrcoef(X,Y)
