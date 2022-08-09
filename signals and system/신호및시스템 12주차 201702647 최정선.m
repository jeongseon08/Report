clc; clear; close all;   %초기화
%입력함수 설정
f0 = input ('기본주파수값을 입력하시오.  : '); %주파수 입력
T=1/f0; %주기 설정
%합성할 함수갯수 입력 설정
k1 = input ('k1값을 입력하시오.  : '); %k1 입력
k2 = input ('k2값을 입력하시오.  : '); %k2 입력
k3 = input ('k3값을 입력하시오.  : '); %k3 입력
k4 = input ('k4값을 입력하시오.  : '); %k4 입력
t=-10:0.001:10; 

%k1번째까지 합성
subplot(2,2,1); %2행1열
xtt=0; %변수 초기화
%if문 선언, Xk:연속 시간 푸리에 급수 계수
if k1==0 %k=0일때 직류
    Xk = (1/2).*sinc((1/2).*k1);
    xt=t.*0+Xk; 
else
    for k= 1:k1
    Xk = (1/2).*sinc((1/2).*k);
    X=Xk.*cos(2.*pi.*f0.*k.*t);
    xtt=xtt+X;
    end
%주기신호 합성
xt=1/2+2.*xtt;
end
plot(t,real(xt));
axis([-2.*T 2.*T 0 2])
title("k="+k1,'fontsize',20)

%k2번째까지 합성: k값에 따른 파형 분석
subplot(2,2,2); 
xtt=0; %변수 초기화
if k2==0
    Xk = (1/2).*sinc((1/2).*k2);
    xt=t.*0+Xk;
else
    for k= 1:k2
    Xk = (1/2).*sinc((1/2).*k);
    X=Xk.*cos(2.*pi.*f0.*k.*t);
    xtt=xtt+X;
    end
xt=1/2+2.*xtt;
end
plot(t,real(xt));
axis([-2.*T 2.*T 0 2])
title("k="+k2,'fontsize',20)

%k3번째까지 합성: k값에 따른 파형 분석
subplot(2,2,3);
xtt=0;
if k3==0
    Xk = (1/2).*sinc((1/2).*k3);
    xt=t.*0+Xk;
else
    for k= 1:k3
    Xk = (1/2).*sinc((1/2).*k);
    X=Xk.*cos(2.*pi.*f0.*k.*t);
    xtt=xtt+X;
    end
xt=1/2+2.*xtt;
end
plot(t,real(xt));
axis([-2.*T 2.*T 0 2])
title("k="+k3,'fontsize',20);

%k4번째까지 합성: k값에 따른 파형 분석
subplot(2,2,4);
xtt=0;
if k4==0
    Xk = (1/2).*sinc((1/2).*k4);
    xt=t.*0+Xk;
else
    for k= 1:k4
    Xk = (1/2).*sinc((1/2).*k);
    X=Xk.*cos(2.*pi.*f0.*k.*t);
    xtt=xtt+X;
    end
xt=1/2+2.*xtt;
end
plot(t,real(xt));
axis([-2.*T 2.*T 0 2])
title("k="+k4,'fontsize',20);
sgtitle("201720647 최정선 f0="+f0,'fontsize',20)