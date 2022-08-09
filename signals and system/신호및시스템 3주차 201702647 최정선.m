clc; clear; close all;      %이전값 초기화
t=-10:0.01:10;              %t범위 설정
sgtitle('201720647 최정선') %서브플롯제목

x1=stepfun(t,0);          %단위계단함수
y1=1/3.*stepfun(t,1);     %진폭 크기변화 및 평행이동
subplot(2,4,1);          %전체 그래프 플로팅 1행1열
plot(t,x1);               %단위계단함수x1 플로팅
hold on                  %현재 플로팅 유지
plot(t,y1);               %함수y1 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on                  %격자 표시
title ('Unit Step Function') %그래프 제목

x2=t.*(t>=0);         %단위램프함수
y2=2.*(t-2).*(t>=2);  %기울기 크기변화 및 평행이동 
subplot(2,4,2);      %전체 그래프 플로팅 1행2열
plot(t,x2);           %단위램프함수x2 플로팅
hold on              %현재 플로팅 유지
plot(t,y2);           %함수y2 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on              %격자 표시
title ('Unit Ramp Function') %그래프 제목


x3=sin(t);             %사인함수
y3=1/2.*sin(2.*pi.*(t+1)); %진폭, 주파수크기변화
subplot(2,4,3);       %전체 그래프 플로팅 1행3열
plot(t,x3);            %사인함수x3 플로팅
hold on               %현재 플로팅 유지
plot(t,y3);            %함수 y3 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on               %격자표시
title ('Sine Function') %그래프 제목


x4=cos(t);             %코사인함수
y4=2.*cos(3.*t);       %진폭,주파수 크기변화
subplot(2,4,4);       %전체 그래프 플로팅 1행4열
plot(t,x4);            %코사인함수x4 플로팅
hold on               %현재 플로팅 유지
plot(t,y4);            %함수 y4 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on               %격자표시
title ('Cosine Function') %그래프 제목

x5=exp(t);             %지수함수
y5=3.*exp(t);          %기울기 변화
subplot(2,4,5);       %전체 그래프 플로팅 2행1열
plot(t,x5);            %지수함수x5 플로팅
hold on               %현재 플로팅 유지
plot(t,y5);            %함수 y5 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on               %격자표시
title ('Exponential Function') %그래프 제목

x6=sinc(t);            %싱크함수
y6=2.*sinc(2.*(t-1/2));%진폭,주파수 변화, 평행이동
subplot(2,4,6);       %전체 그래프 플로팅 2행2열
plot(t,x6);            %싱크함수x6 플로팅
hold on               %현재 플로팅 유지
plot(t,y6);            %함수 y6 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on               %격자표시
title ('Sinc Function') %그래프 제목

x7=x1+2;            %u(t)+2
subplot(2,4,7);     %전체 그래프 플로팅 2행3열
plot(t,x7);         %함수x7 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on             %격자표시
title ('u(t)+2')    %그래프 제목

x8=x6.*(t==0);      %sinc(t)*δ(t)
subplot(2,4,8);     %전체 그래프 플로팅 2행4열
plot(t,x8);         %함수x8 플로팅
axis([-5 5 -5 5]);        %x축 y축 그래프 범위
grid on             %격자표시
title ('sinc(t)*δ(t)') %그래프 제목

