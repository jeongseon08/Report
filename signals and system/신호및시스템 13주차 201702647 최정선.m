clc; clear; close all;      %이전값 초기화
Ts = 1e-3; %주기 샘플링
t = 0:Ts:1-Ts; %시간축 영역
fs = 1/Ts;   %주파수 샘플링
f = 0:(length(t)-1); %주파수 영역
n = length(t); %length(t):1000
sgtitle('201720647 최정선') %서브플롯제목

%%입력신호 푸리에 변환
x = 2.*cos(2.*pi.*10.*t)+ 4.*sin(2.*pi.*20.*t); %입력신호
subplot(3,4,1);
plot(t,x)
xlabel('t')
title("x(t)");

xf=fft(x);  %푸리에변환(fft)
fshift = (-n/2:n/2-1);  %주파수축 이동
xfshift = fftshift(xf); %영주파수성분 이동
xf=xfshift./n; %데이터수가 진폭의 크기에 영향을 줬으므로 나눈다.
subplot(3,4,2);
plot(fshift,abs(xf))
axis([-100 100 0 3])
xlabel('f')
title("X(f)");

%%저역 필터
h1=2.*rectpuls(fshift,31); % -15부터 15까지 2의 크기 출력.
subplot(3,4,5)
plot(fshift,h1)
axis([-50 50 0 5])
xlabel('f');
title("저역 통과 필터:H1(f)");

%출력함수(주파수 영역);저역필터
yf1=xf.*h1;    % X(f)와 H(f)의 곱
subplot(3,4,6)
plot(fshift,abs(yf1))
axis([-50 50 0 5])
xlabel('f');
title("필터링:X(f)*H1(f)");

%출력함수 푸리에 역변환(저역필터)
yf1shift= ifftshift(yf1);  % 푸리에 역변환을 위한 주파수 평면 이동.
yf1=yf1shift;  
subplot(3,4,7)
plot(f,abs(yf1))
xlabel('f')
title("주파수 그래프 역평행이동");

yt1=ifft(yf1).*n; %푸리에변환때 데이터수 나눈만큼 곱한다.
subplot(3,4,8)
plot(t,real(yt1))
xlabel('t')
title("출력신호 y(t)=4cos(2pi10t)");

%%대역 필터
h2=3.*rectpuls(fshift,51)-3.*rectpuls(fshift,29);
% 51 -> -25 ~ 25 / 29 -> -14 ~ 14 따라서 -25 ~ -15 , 15 ~ 25 구간 생성 subplot(3,4,9)
subplot(3,4,9)
plot(fshift,h2)
axis([-50 50 0 5])
xlabel('f')
title("대역 통과 필터:H2(f)");

%출력함수(주파수영역);대역필터
yf2=xf.*h2;
subplot(3,4,10)
plot(fshift,abs(yf2))
axis([-50 50 0 10])
xlabel('f')
title("필터링:X(f)*H2(f)");

%출력함수 푸리에 역변환(대역필터)
yf2shift= ifftshift(yf2);
yf2=yf2shift;
subplot(3,4,11)
plot(f,abs(yf2))
axis([0 1000 0 10])
xlabel('f')
title("주파수 그래프 역평행이동");

yt2=ifft(yf2).*n;  %푸리에변환때 데이터수 나눈만큼 곱한다.
subplot(3,4,12)
plot(t,real(yt2))
xlabel('t')
title("출력신호 y(t)=12sin(2pi20t)");
