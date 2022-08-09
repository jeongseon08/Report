clc; clear; close all;      %이전값 초기화
Ts = 0.1; %주기 샘플링
t = -10:Ts:10-Ts; %시간축 영역
fs = 1/Ts;   %주파수 샘플링
f = 0:(length(t)-1); %주파수 영역
n = length(t); %n=200
fshift = (-n/2:n/2-1);  %주파수축 이동
sgtitle('201720647 최정선') %서브플롯제목

%%입력신호와 전달함수(펄스열)
%사각파
x1 = rectpuls(t,1); 
subplot(4,3,1)
plot(t,x1)
xlabel('t');
title("x1(t)=사각파");

%삼각파
x2 = tripuls(t,1);
subplot(4,3,2)
plot(t,x2)
xlabel('t');
title("x2(t)=삼각파");

%전달함수(펄스열)
p=rem(t,2)==0;
subplot(4,3,3)
plot(t,p)
xlabel('t');
title("p(t)=펄스열");

%%입력신호 푸리에변환
%사각파 푸리에변환
xf1=fft(x1);  %푸리에변환(fft)
xfshift = fftshift(xf1); %영주파수성분 이동
xf1=xfshift./n; %데이터수가 진폭의 크기에 영향을 줬으므로 나눈다.
subplot(4,3,4)
plot(fshift,abs(xf1))
xlabel('f')
title("X1(f)");

%삼각파 푸리에변환
xf2=fft(x2);  %푸리에변환(fft)
xfshift = fftshift(xf2); %영주파수성분 이동
xf2=xfshift./n; %데이터수가 진폭의 크기에 영향을 줬으므로 나눈다.
subplot(4,3,5)
plot(fshift,real(xf2))
xlabel('f')
title("X2(f)");

%펄스열 푸리에변환
pf=fft(p);  %푸리에변환(fft)00
pfshift = fftshift(pf); %영주파수성분 이동
subplot(4,3,6)
plot(fshift,real(pf))
xlabel('f')
title("P(f)");

%%컨볼루션곱
%사각파 펄스열 컨볼루션곱
y=conv(x1,p,"same");
subplot(4,3,7)
plot(t,y);
title("y1(t)=x1x*p");

%삼각파 펄스열 컨볼루션곱
y=conv(x2,p,"same");
subplot(4,3,8)
plot(t,y);
title("y2(t)=x1x*p");

%%푸리에함수곱
%사각파 푸리에변환X 펄스열 푸리에 변환
yf1=xf1.*pf;
subplot(4,3,10)
plot(fshift,abs(yf1));
title("Y1(f)");
%삼각파 푸리에변환X 펄스열 푸리에 변환
yf2=xf2.*pf;
subplot(4,3,11)
plot(fshift,abs(yf2));
title("Y2(f)");