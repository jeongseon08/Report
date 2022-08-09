n=-2:1:5 %n값은-2부터5까지 1씩 증가한다.
%변수 a,b,c,d,e,f,z 선언
a=(n==-1);
b=(n==0);
c=(n==1);
d=(n==2);
e=(n==3);
f=1/2.*(n==4);
z=a+b+c+d+e+f;
sgtitle('201720647 최정선') %서브플롯제목

subplot(4,1,1); %4행1열 1번째에 x[n]그래프 도식
stem(n,z,'lineWidth',2,'MarkerSize',3); %그래프생성 및 선굵기,원크기
axis([-10 10 0 2]); %x축 y축 그래프 범위
grid %격자표시
title x[n] %그래프 제목 

subplot(4,1,2);%4행1열 2번째에 x[n-2]그래프 도식
stem(n-2,z,'lineWidth',2,'MarkerSize',3); %그래프생성 및 선굵기,원크기
axis([-10 10 0 2]);%x축 y축 그래프 범위
grid %격자표시
title x[n-2] %그래프 제목

subplot(4,1,3);%4행1열 3번째에 x[4-n]그래프 도식
stem(4-n,z,'lineWidth',2,'MarkerSize',3); %그래프생성 및 선굵기,원크기
axis([-10 10 0 2]);%x축 y축 그래프 범위
grid %격자표시
title x[4-n] %그래프 제목

subplot(4,1,4);%4행1열 4번째에 x[2n]그래프 도식
stem(2*n,z,'lineWidth',2,'MarkerSize',3); %그래프생성 및 선굵기,원크기
axis([-10 10 0 2]);%x축 y축 그래프 범위
grid %격자표시
title x[2n] %그래프 제목