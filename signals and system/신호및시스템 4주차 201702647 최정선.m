clc; clear; close all;          %이전값 초기화
t=-10:0.01:10;                  %정의역 설정
sgtitle('201720647 최정선')     %서브플롯제목

x1=1/2.*cos(2.*pi.*t);          %진폭 1/2, 주파수1[hz]
subplot(2,3,1);                 %전체 그래프 플로팅 1행1열
plot(t,x1);                     %함수x1 플로팅
axis([-3 3 -3 3]);              %x축 y축 범위
grid on                         %격자표시
title ('x1=1/2cos(2\pit)')      %그래프 제목

x2=cos(4.*pi.*t);               %진폭 1, 주파수2[hz]
subplot(2,3,2);                 %전체 그래프 플로팅 1행2열
plot(t,x2);                     %g함수x2 플로팅
axis([-3 3 -3 3]);              %x축 y축 범위
grid on                         %격자표시
title ('x2=cos(4\pit)')         %그래프 제목

x3=2/3.*cos(6.*pi.*t);          %진폭 2/3, 주파수3[hz]
subplot(2,3,3);                 %전체 그래프 플로팅 1행3열
plot(t,x3);                     %함수x3 플로팅
axis([-3 3 -3 3]);              %x축 y축 범위
grid on                         %격자표시
title ('x3=2/3cos(6\pit)')      %그래프 제목

x4=3/5.*cos(10.*pi.*(t-1/2));   %진폭 3/5, 주파수5[hz], 위상차:1/2
subplot(2,3,4);                 %전체 그래프 플로팅 2행1열
plot(t,x4);                     %함수x4 플로팅
axis([-3 3 -3 3]);              %x축 y축 그래프 범위
grid on                         %격자표시
title('x4=3/5cos(10\pi(t-1/2))')%그래프 제목

x5=2/3.*cos(3.*pi.*t);          %진폭 2/3, 주파수3/2[hz]
subplot(2,3,5);                 %전체 그래프 플로팅 2행2열
plot(t,x5);                     %함수x5 플로팅
axis([-3 3 -3 3]);              %x축 y축 범위
grid on                         %격자표시
title ('x5=2/3cos(3\pit)')      %그래프 제목

x6=x1+x2+x3+x4+x5;              %고조파 파형
subplot(2,3,6);                 %전체 그래프 플로팅 2행3열
plot(t,x6);                     %함수x6 플로팅
axis([-3 3 -3 3]);              %x축 y축 범위
grid on                         %격자표시
title ('고조파 파형')           %그래프 제목