#include <avr/io.h> //DDR,PORT 레지스터의 정보들이 정의가 되어있는 라이브러리
#include <util/delay.h> // delay함수들이 시간 지연을 위해서 사용되는 경우가 많다.
#include <avr/interrupt.h> // (외부)인터럽트 사용에 따른 라이브러리 추가

unsigned char fnd_db[10]= {0x77,0x41,0x3b,0x6b,0x4d,0x6e,0x7e,0x47,0x7f,0x6f};// 0부터 9까지 선언
int time; //오버플로 발생시 증가하는 변수
time=0; //변수 초기화

ISR(TIMER1_OVF_vect)//TC1: 오버플로 발생 시 카운팅
{
	time = time +1;
}

int main()
{
	//변수 또는 레지스터의 설정 부분
	int num = 0; // 분, 초를 나타내기 위한 변수
	int a=0; // 1초 단위를 세기 위한 변수
	int b=0; // 10초 단위를 세기 위한 변수
	int c=0; // 1분 단위를 세기 위한 변수
	int d=0; // 10분 단위를 세기 위한 변수

	//레지스터 설정
	DDRE = 0xff; //7세그먼트 출력설정
	DDRC = 0xff; //7세그먼트 전원 4: 10분 5: 1분 6: 10초  7: 1초

	//TC1 설정(16비트)
	TCCR1A= 0x02; //위상정정 PWM모드+256분주비(프리스케일러 값)
	TCCR1B= 0x04; //최대값: 1FF, 61회 반복시  1초와 근사값 2.528[ms]오차
	TIMSK = 0x04; //TIC1의 오버플로 인터럽트 설정 >> 개별 인터럽트 활성화
	sei (); //전역인터럽트 활성화

	//실험 초기화
	PORTE = fnd_db[a]; //CA형 이므로 not
	PORTC = 0x0f; //최초 0000을 디스플레이하기  위한 초깃값, CA형 이므로 not

	while(1)
	{
		a = (num%60)%10;
		b = (num%60)/10;
		c = (num/60)%10;
		d = (num/60)/10;
		//1의 자리를 디스플레이
		PORTE = fnd_db[a]; //CA형 이므로 not
		PORTC = 0x7F; //1의 자리 'display on' 6번 비트 1:on,CA형 이므로 not
		_delay_ms(50);	
		//10의 자리를 디스플레이
		PORTE = fnd_db[b];//CA형 이므로 not
		PORTC = 0xBF;//10의 자리 'display on' 7번 비트 1:on.CA형 이므로 not
		_delay_ms(50);	

		//1의 자리를 디스플레이
		PORTE = fnd_db[c];//CA형 이므로 not
		PORTC = 0xDF; //1의 자리 'display on' 4번 비트 1:on,v
		_delay_ms(50);	
		//10의 자리를 디스플레이
		PORTE = fnd_db[d];//CA형 이므로 not
		PORTC = 0xEF; //10의 자리 'display on' 5번 비트 1:on,CA
		_delay_ms(100);		

		if (time % 62 == 0) //1FF, 61회 반복시  1초와 근사값 2.528[ms]오차
		{
			num=num+1;
			_delay_ms(100);
		}
	}	
	return 0;
}
	
