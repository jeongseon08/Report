#include<stdio.h>
void main()
{
int a; //정수형변수선언
char b[8]="Basic-C"; //문자열배열의 초기화 갯수는 7개이지만,베열크기는 8로 한 이유는 문자열배열 마지막에 문자열끝을 나타내는 널(null)문자인 '\0'를 자동으로 입력받기 위해서이다.
for(a=0;a<=7;a++)
	printf("b[%d]=%c\n",a,b[a]);
printf("문자열 배열 b=%s\n",b); //배열b를 문자열로 출력하면, 첫번째 원소인 'B'부터 마지막원소인 널문자(문자열 끝)
//즉 '\0'까지 출력해준다.
b[6]='#';
printf("배열b=%s\n",b);
}