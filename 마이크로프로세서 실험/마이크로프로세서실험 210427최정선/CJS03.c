#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
unsigned char fnd_db[10] = {0x77,0x41,0x3b,0x6b,0x4d,0x6e,0x7e,0x47,0x7f,0x6f};//0부터9까지 
	int i;
ISR(INT0_vect)
{
	i=i-2; //인터럽트(하강에지) 발생시 2씩 감소한다.
}


ISR(INT1_vect)
{
	i=i+2; //인터럽트(상승에지) 발생시 2씩 증가한다.
}

int main()
{
	DDRA = 0xff;//포트 A는 출력단자-전원역할
	DDRE = 0xff;//포트 E는 출력단자-7세그먼트로 전달할 신호
	DDRD = 0x00;//포트 D는 입력단자-포트의0번과1번이 결국 INT0,INT1
	EIMSK = 0x03;//INT0,INT1
	EICRA = 0x0E;//외부 인터럽트조건 설정 (E=1110=INT0:하강에지, INT1:상승에지)
	sei(); 

	//실험 초기화
	PORTA =0xff;
	PORTE =fnd_db[i];//최초 7세그먼트 동작화면은 i
	_delay_ms(500);
	i=9;//i=9이므로 9로 최초 7세그먼트는 9로 동작한다.

	while(1) //인터럽트 실행 동작은 while문 안에 배치해야 된다.
	{
		if (i < 0) i=0;
		if (i > 9) i=9;
		PORTE =fnd_db[i];
		_delay_ms(500);
	}
	return 0;
}
