#include <avr/io.h> //DDR,PORT 레지스터의 정보들이 정의가 되어있는 라이브러리
#include <util/delay.h> // delay함수들이 시간 지연을 위해서 사용되는 경우가 많다.
#include <avr/interrupt.h> // (외부)인터럽트 사용에 따른 라이브러리 추가

unsigned char fnd_db[10]= {0x77, 0x41, 0x3b,0x5b,0x4d,0x5e,0x7c,0x43,0x7f,0x4f};// 0부터 9까지 선언
int i=0; //외부 인터럽트 이벤트 발생 시 동작할 수 있도록 변수를 선언

ISR(INT0_vect)// 외부인터럽트에 0번에 대한 서비스루틴 함수 작성
{
	i=1; //외부 인터럽트 발생을 main함수에 알리기 위해서 i값을 변경
}


int main()
{
	//변수 또는 레지스터의 설정 부분
	int sec = 30;
	int min = 01;
	int a=0;
	int b=0;
	int c=0;
	int d=0;
	//디지털 10기능 관련 레지스터 설정
	DDRE = 0xff; //7세그먼트 출력설정
	DDRC = 0xff; //7세그먼트 전원
	DDRA = 0xff; //상승에지를 위한 전원
	DDRD = 0x00; //외부인터럽트 0번 사용에 따른 입력설정
	
	//외부인터럽트 관련 설정
	EIMSK = 0x01; //INT0 개별인터럽트 활성화
	EICRA = 0x03; //INT0 (외부인터럽트0-상승):1,0 , 0번과 1번 비트를 설정해서 상승에지에서 인터럽트 조건이 발생하도록 설정
	sei (); //전역인터럽트 활성화

	//실험 초기화
	PORTA = 0xff;
	PORTE = fnd_db[0];
	PORTC = 0x0f;

	while(1)
	{
	//1의 자리를 디스플레이
		a=sec%10;
		b=(sec/10)%10;

		PORTE = fnd_db[a];
		PORTC = 0xBE; //1의 자리 'display on' 6번 비트 0:on
		_delay_ms(10);//숫자를 관찰할 수 있도록 delay부여

		//10의 자리를 디스플레이
		PORTE = fnd_db[b];
		PORTC = 0x7E;//10의 자리 'display on' 7번 비트 0:on
		_delay_ms(10);//숫자를 관찰할 수 있도록 delay부여

		//num1 값에서 10분 단위에 값을 d에, 1분 단위의 값을 c에 넣어주는 부분
		 //1의자리 값, %10은 10으로 나눴을때의 나머지 값
		 //10의자리 값, %10은 10으로 나눴을때의 나머지 값
		c=min%10;
		d=(min/10)%10;
		//1의 자리를 디스플레이
		PORTE = fnd_db[c];
		PORTC = 0xEE; //1의 자리 'display on' 4번 비트 0:on
		_delay_ms(10); //숫자를 관찰할 수 있도록 delay부여

		//10의 자리를 디스플레이
		PORTE = fnd_db[d];
		PORTC = 0xDE; //10의 자리 'display on' 5번 비트 0:on
		_delay_ms(10);//숫자를 관찰할 수 있도록 delay부여// 1초마다 변수를 1씩 증가하는 부분을 작성
	if(i==1) //인터럽트 감지시 실제 동작부분
		{
		sec = sec-1;//1초마다 1씩 증가		
		if(sec<0)//59초 이후에 60이 아닌 00을 디스플레이
			{
			sec=59;
			min = min-1;// 1분마다 1씩 감소
			}
		if(min<0)
			{
			min = 0;
			sec = 0;
			}
		if ((sec||min)==0)
			{
			PORTC=0x01;
			}
		_delay_ms(1000);//1초의 조건
		}
	}	
	return 0;
}
	
