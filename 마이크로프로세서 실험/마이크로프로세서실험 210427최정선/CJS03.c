#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
unsigned char fnd_db[10] = {0x77,0x41,0x3b,0x6b,0x4d,0x6e,0x7e,0x47,0x7f,0x6f};//0����9���� 
	int i;
ISR(INT0_vect)
{
	i=i-2; //���ͷ�Ʈ(�ϰ�����) �߻��� 2�� �����Ѵ�.
}


ISR(INT1_vect)
{
	i=i+2; //���ͷ�Ʈ(��¿���) �߻��� 2�� �����Ѵ�.
}

int main()
{
	DDRA = 0xff;//��Ʈ A�� ��´���-��������
	DDRE = 0xff;//��Ʈ E�� ��´���-7���׸�Ʈ�� ������ ��ȣ
	DDRD = 0x00;//��Ʈ D�� �Է´���-��Ʈ��0����1���� �ᱹ INT0,INT1
	EIMSK = 0x03;//INT0,INT1
	EICRA = 0x0E;//�ܺ� ���ͷ�Ʈ���� ���� (E=1110=INT0:�ϰ�����, INT1:��¿���)
	sei(); 

	//���� �ʱ�ȭ
	PORTA =0xff;
	PORTE =fnd_db[i];//���� 7���׸�Ʈ ����ȭ���� i
	_delay_ms(500);
	i=9;//i=9�̹Ƿ� 9�� ���� 7���׸�Ʈ�� 9�� �����Ѵ�.

	while(1) //���ͷ�Ʈ ���� ������ while�� �ȿ� ��ġ�ؾ� �ȴ�.
	{
		if (i < 0) i=0;
		if (i > 9) i=9;
		PORTE =fnd_db[i];
		_delay_ms(500);
	}
	return 0;
}
