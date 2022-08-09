#include <avr/io.h> //DDR,PORT 레지스터의 정보들이 정의가 되어있는 라이브러리
#include <util/delay.h> // delay함수들이 시간 지연을 위해서 사용되는 경우가 많다.
#include <avr/interrupt.h> // (외부)인터럽트 사용에 따른 라이브러리 추가

unsigned char fnd_db[10]= {0x77,0x41,0x3b,0x6b,0x4d,0x6e,0x7e,0x47,0x7f,0x6f};// 0부터 9까지 선언 
int in0; 
int in1; //외부인터럽트 이벤트 발생 시 동작 할 수 있도로 변수를 선언
int time; //20msec마다 1씩 증가하는 변수


in0=0;
in1=0;
time=0;

ISR(INT0_vect)// 외부인터럽트에 0번에 대한 서비스루틴 함수 작성
{
	in0=1; //외부 인터럽트 발생을 main함수에 알리기 위해서 in값을 변경
}

ISR(INT1_vect)// 외부인터럽트에 1번에 대한 서비스루틴 함수 작성
{
	in1=in1+1; //외부 인터럽트 발생을 main함수에 알리기 위해서 in1값을 변경
}

ISR(TIMER0_OVF_vect)//TC0
{
	time = time +1;
}

int main()
{
	//변수 또는 레지스터의 설정 부분
	int num = 0;
	int num1 = 0;
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
	EIMSK = 0x03; //INT0.INT1 개별인터럽트 활성화
	EICRA = 0x0F; //INT0 (외부인터럽트0-상승):1,0 , 0번과 1번 비트를 설정해서 상승에지에서 인터럽트 조건이 발생하도록 설정

	//TC0 설정 TCCR0, TIMSK
	TCCR0 = 0x04; //일반모드+64분주비(프리스케일러 값)
	TIMSK = 0x01; //TC0의 오버플로 인터럽트 사용하도록 개별 활성화를 시킨다.
	sei (); //전역인터럽트 활성화


	//실험 초기화
	PORTA=0xff;
	PORTE = fnd_db[0];
	PORTC = 0x0f; //최초 0000을 디스플레이하기  위한 초깃값

	while(1)
	{
		if(in0==1)
		{
			//실제 동작 부분을 작성
			//0.01초마다 변수를 1씩 증가하는 부분을 작성
			//오버플로우 인터럽트 주기: (256*64)/(16*10^6)=0.001024, 
			if(time % 11==0) //time 변수의 값이 11의 배수가 될 때 마다, 즉 0.01초가 경과할때마다 증가(10번 오버플로우: 0.01024초)
			{
				if(in1%2==1)//홀수번일때 멈춤
				 {
					num = num;
				}	
				if(in1%2==0)//짝수일때 재시작
				{
					num = num +1 ;
				}

				if(num >= 100) //0.01초가 100번 이후에 100이 아닌 1초로 올려주기
				{
					num = 0;
					num1 = num1 + 1;
					if(num1 >= 60)//59.99초 이후에 0000을 디스플레이하기 위해
					{
						num1 = 0;
						in0=0;
					}
				}

			}
			
		}
		a = num%10;
		b = (num/10)%10;
		//1의 자리를 디스플레이
		PORTE = fnd_db[a];
		PORTC = 0xEF; //1의 자리 'display on' 6번 비트 1:on
		_delay_ms(2);//숫자를 관찰할 수 있도록 delay부여

		//10의 자리를 디스플레
		PORTE = fnd_db[b];
		PORTC = 0xDF;//10의 자리 'display on' 7번 비트 1:on
		_delay_ms(2);//숫자를 관찰할 수 있도록 delay부여

		c=num1%10;
		d=(num1/10)%10;
		//1의 자리를 디스플레이
		PORTE = fnd_db[c];
		PORTC = 0xBF; //1의 자리 'display on' 4번 비트 1:on
		_delay_ms(2); //숫자를 관찰할 수 있도록 delay부여

		//10의 자리를 디스플레이
		PORTE = fnd_db[d];
		PORTC = 0x7F; //10의 자리 'display on' 5번 비트 1:on
		_delay_ms(2);//숫자를 관찰할 수 있도록 delay부여

	}	
	return 0;
}
	
