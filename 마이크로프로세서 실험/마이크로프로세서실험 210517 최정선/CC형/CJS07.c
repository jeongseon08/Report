#include <avr/io.h> //DDR,PORT ���������� �������� ���ǰ� �Ǿ��ִ� ���̺귯��
#include <util/delay.h> // delay�Լ����� �ð� ������ ���ؼ� ���Ǵ� ��찡 ����.
#include <avr/interrupt.h> // (�ܺ�)���ͷ�Ʈ ��뿡 ���� ���̺귯�� �߰�

unsigned char fnd_db[10]= {0x77,0x41,0x3b,0x6b,0x4d,0x6e,0x7e,0x47,0x7f,0x6f};// 0���� 9���� ����
int time; //�����÷� �߻��� �����ϴ� ����
time=0; //���� �ʱ�ȭ

ISR(TIMER1_OVF_vect)//TC1: �����÷� �߻� �� ī����
{
	time = time +1;
}

int main()
{
	//���� �Ǵ� ���������� ���� �κ�
	int num = 0; // ��, �ʸ� ��Ÿ���� ���� ����
	int a=0; // 1�� ������ ���� ���� ����
	int b=0; // 10�� ������ ���� ���� ����
	int c=0; // 1�� ������ ���� ���� ����
	int d=0; // 10�� ������ ���� ���� ����

	//�������� ����
	DDRE = 0xff; //7���׸�Ʈ ��¼���
	DDRC = 0xff; //7���׸�Ʈ ���� 4: 10�� 5: 1�� 6: 10��  7: 1��

	//TC1 ����(16��Ʈ)
	TCCR1A= 0x02; //�������� PWM���+256���ֺ�(���������Ϸ� ��)
	TCCR1B= 0x04; //�ִ밪: 1FF, 61ȸ �ݺ���  1�ʿ� �ٻ簪 2.528[ms]����
	TIMSK = 0x04; //TIC1�� �����÷� ���ͷ�Ʈ ���� >> ���� ���ͷ�Ʈ Ȱ��ȭ
	sei (); //�������ͷ�Ʈ Ȱ��ȭ

	//���� �ʱ�ȭ
	PORTE = fnd_db[a]; //CA�� �̹Ƿ� not
	PORTC = 0x0f; //���� 0000�� ���÷����ϱ�  ���� �ʱ갪, CA�� �̹Ƿ� not

	while(1)
	{
		a = (num%60)%10;
		b = (num%60)/10;
		c = (num/60)%10;
		d = (num/60)/10;
		//1�� �ڸ��� ���÷���
		PORTE = fnd_db[a]; //CA�� �̹Ƿ� not
		PORTC = 0x7F; //1�� �ڸ� 'display on' 6�� ��Ʈ 1:on,CA�� �̹Ƿ� not
		_delay_ms(50);	
		//10�� �ڸ��� ���÷���
		PORTE = fnd_db[b];//CA�� �̹Ƿ� not
		PORTC = 0xBF;//10�� �ڸ� 'display on' 7�� ��Ʈ 1:on.CA�� �̹Ƿ� not
		_delay_ms(50);	

		//1�� �ڸ��� ���÷���
		PORTE = fnd_db[c];//CA�� �̹Ƿ� not
		PORTC = 0xDF; //1�� �ڸ� 'display on' 4�� ��Ʈ 1:on,v
		_delay_ms(50);	
		//10�� �ڸ��� ���÷���
		PORTE = fnd_db[d];//CA�� �̹Ƿ� not
		PORTC = 0xEF; //10�� �ڸ� 'display on' 5�� ��Ʈ 1:on,CA
		_delay_ms(100);		

		if (time % 62 == 0) //1FF, 61ȸ �ݺ���  1�ʿ� �ٻ簪 2.528[ms]����
		{
			num=num+1;
			_delay_ms(100);
		}
	}	
	return 0;
}
	
