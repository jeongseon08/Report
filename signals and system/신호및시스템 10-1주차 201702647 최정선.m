clc; clear; close all;   %초기화
n=-100:0.1:100;
a = input ('실수부  : '); %실수부 입력
b = input ('허수부  : '); %허수부 입력
sgtitle('201720647 최정선') %서브플롯제목

x = (1/a+j.*b).^n;        %복소수 선언
subplot(4,4,1);           %1행1열
stem(n,real(x))           %시간n에 따른 실수값
title("실수")             
subplot(4,4,2);           %1행2열
stem(n,imag(x))           %시간n에 따른 허수값
title("허수")  
subplot(4,4,3);           %1행3열
stem(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수")       
subplot(4,4,4);           %1행4열
plot(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수:plot")

x = (a+j.*b).^n;          %복소수 선언
subplot(4,4,5);           %2행1열
stem(n,real(x))           %시간n에 따른 실수값
title("실수")  
subplot(4,4,6);           %2행2열
stem(n,imag(x))           %시간n에 따른 허수값
title("허수")  
subplot(4,4,7);           %2행3열
stem(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수")  
subplot(4,4,8);           %2행4열
plot(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수:plot")  

x = ((-1)/a-j.*b).^n;     %복소수 선언
subplot(4,4,9);           %3행1열
stem(n,real(x))           %시간n에 따른 실수값
title("실수")  
subplot(4,4,10);          %3행2열
stem(n,imag(x))           %시간n에 따른 허수값
title("허수")  
subplot(4,4,11);          %3행3열
stem(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수")  
subplot(4,4,12);          %3행4열
plot(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수:plot")  


x = (-a-j.*b).^n;         %복소수 선언
subplot(4,4,13);           %4행1열
stem(n,real(x))           %시간n에 따른 실수값
title("실수")  
subplot(4,4,14);          %4행2열
stem(n,imag(x))           %시간n에 따른 허수값
title("허수")  
subplot(4,4,15);          %4행3열
stem(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수")  
subplot(4,4,16);          %4행4열
plot(real(x),imag(x))     %x축:실수, y축:허수
title("실수+허수:plot")  
