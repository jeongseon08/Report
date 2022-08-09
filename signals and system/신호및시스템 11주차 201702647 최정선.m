clc; clear; close all;      %이전값 초기화
Ts = 1/1000; %샘플링 시간
t = 0:Ts:0.5-Ts; %시간축
%4개의 cos신호의 합
a =4.*cos(20.*pi.*t); 
b =2.*cos(40.*pi.*t+pi./2);
c =cos(60.*pi.*t);
d =cos(120.*pi.*t-pi./2);
xt =a+b+c+d;
sgtitle('201720647 최정선') %서브플롯제목
%시간에 따른 x(t)
subplot(2,2,1);
plot(t,xt);
xlabel 't'
ylabel 'x(t)'
grid
title("시간축 그래프");

%푸리에변환
xf = fft(xt); %fast Fourier transform
xfshift = fftshift(xf) %영주파수 성분을 스펙트럼의 가운데로 이동
lxf = length(xf); %스펙트럼 범위
f = (-lxf/2:lxf/2-1)/lxf/Ts; %주파수 범위
xfshift = fftshift(xf);
%진폭 스펙트럼
subplot(2,2,2);
plot(f,abs(xfshift)/length(xt)) %abs=크기로 진폭을 나타낸다.length(xt)로 나눠줘야 올바르게 진폭이나온다.
axis([-100 100 0 3])
xlabel 'Frequency (Hz)'
ylabel '|y|'
grid
title("진폭 스펙트럼");


%위상 스펙트럼1 (노이즈;오차 존재)
theta = angle(xfshift); %위상
subplot(2,2,3);
plot(f,theta)
xlabel 'Frequency (Hz)'
ylabel 'Phase'
grid
title("노이즈가 섞인 위상스펙트럼");

%위상 스펙트럼2(노이즈; 오차 제거)
tol = 1e-6; %오차허용 크기
xfshift(abs(xfshift) < tol) = 0; %오차 허용범위 아랫값은 0으로 보낸다.
theta = angle(xfshift); %위상

subplot(2,2,4);
plot(f,theta)
xlabel 'Frequency (Hz)'
ylabel 'Phase'
grid
title("올바른 위상스펙트럼");
