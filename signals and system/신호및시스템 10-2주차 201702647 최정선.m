clc; clear; close all;   %초기화
n = -10:1:100; x_n=(n==0);%입력함수(미정)
u=stepfun(n,0); %입력: 단위계단함수
a = [2]; %x[n]의 상수
b = [1, 0.8]; %y[n],y[n-1]의 상수

sgtitle('201720647 최정선') %서브플롯제목
subplot(2,2,1); %1행1열
h=filter(a,b,x_n); %FIR 필터링
stem(n,h); %임펄스 응답
title("Impulse response")

subplot(2,2,2); %1행2열
h1=filter(a,b,u); %FIR 필터링
stem(n,h1); %임펄스 응답
title("u(n)''s Impulse response")

subplot(2,2,3); %1행3열
y_n=conv(x_n,h);
stem(n,y_n(1:length(n)))
title('convolution'); % 컨볼루션


subplot(2,2,4); %1행4열
y_n=conv(x_n,h1);
stem(n,y_n(1:length(n)))
title('u(n)''s convolution'); % 컨볼루션