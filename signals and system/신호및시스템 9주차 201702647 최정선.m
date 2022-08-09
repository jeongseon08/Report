clc; clear; close all;   %이전값 초기화
%지수함수
n=-10:1:10;              %n범위 설정
sgtitle("201720647 최정선")
subplot(4,4,1);           %1행1열
x=(0.9).^n;              %지수함수
stem(n,real(x));         %이산함수 플로팅
xlabel("n"), ylabel("V") %x축 y축 값
title("0<a<1")           
grid on                  %격자표시

subplot(4,4,2);          %1행2열
x=(10/9).^n;             %지수함수
stem(n,real(x));         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("V")
title("a>1")

%복소 지수함수
subplot(4,4,3);          %1행1열
x=(-0.9).^n;             %지수함수
stem(n,real(x));         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("V")
title("0<a<1")

subplot(4,4,4);          %1행1열
x=(-10/9).^n;             %지수함수
stem(n,real(x));         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("V")
title("0<a<1")


subplot(4,4,6);          %1행2열
x=(-10/9).^n;            %지수함수
stem(real(x),imag(x));         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("V")
title("a>1")

subplot(4,4,7);          %1행1열
x=(-0.9).^n;             %지수함수
y=imag(x)
stem(n,y);         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("imag(V)")
title("0<a<1")

subplot(4,4,8);          %1행2열
x=(-10/9).^n;            %지수함수
y=imag(x)
stem(n,y);         %이산함수 플로팅
grid on                  %격자표시
xlabel("n"), ylabel("imag(V)")
title("a>1")