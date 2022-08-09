%초기화및 정의역 설정
clc; clear; close all;        %이전값 초기화
t=0:0.01:10;                  %입력함수 정의역 설정
T=0:0.01:3;                   %임펄스응답 정의역 설정

%함수 선언
h = T/3;                      %임펄스응답
x1= exp(-t);                  %입력함수1: 지수함수
x2= stepfun(t,0);             %단위계단함수
x3= t.*(t>=0);                %단위램프함수
x4= sin(t);                   %사인함수
x5= cos(t);                   %코사인함수
%출력함수 선언
y1= conv(x1,h);
y2= conv(x2,h);
y3= conv(x3,h);
y4= conv(x4,h);
y5= conv(x5,h);

sgtitle('201720647 최정선')     %서브플롯제목
subplot(3,4,1);                 %전체 그래프 플로팅 1행1열
plot(T,h);                      %함수h 플로팅
title ('임펄스 응답')           %그래프 제목
xlabel("T(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,3);                 %전체 그래프 플로팅 1행3열
plot(t,x1);                     %함수x1 플로팅
title ('입력신호: 지수함수')     %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,4);                 %전체 그래프 플로팅 1행4열
plot(t,y1(1:length(t)));        %함수y1 플로팅
%임펄스응답x축(T)를 입력신호x축(t)에 맞게 길이 조정
title ('출력신호')              %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,5);                 %전체 그래프 플로팅 2행1열
plot(t,x2);                     %함수x2 플로팅
title ('입력신호: 단위계단함수') %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,6);                 %전체 그래프 플로팅 2행2열
plot(t,y2(1:length(t)));        %함수y2 플로팅
title ('출력신호')              %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,7);                 %전체 그래프 플로팅 2행3열
plot(t,x3);                     %함수x3 플로팅
title ('입력신호: 단위램프함수') %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,8);                 %전체 그래프 플로팅 2행4열
plot(t,y3(1:length(t)));        %함수y3 플로팅
title ('출력신호')              %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,9);                 %전체 그래프 플로팅 3행1열
plot(t,x4);                     %함수x4 플로팅
title ('입력신호: 사인함수')     %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,10);                 %전체 그래프 플로팅 3행2열
plot(t,y4(1:length(t)));         %함수y4 플로팅
title ('출력신호')               %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                          %격자표시

subplot(3,4,11);                 %전체 그래프 플로팅 3행3열
plot(t,x5);                      %함수x5 플로팅
title ('입력신호: 코사인함수')   %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시

subplot(3,4,12);                %전체 그래프 플로팅 3행4열
plot(t,y5(1:length(t)));        %함수y5 플로팅
title ('출력신호')              %그래프 제목
xlabel("t(sec)")                %x축레이블 지정
ylabel("Voltage(V)")            %y축레이블 지정
grid on                         %격자표시