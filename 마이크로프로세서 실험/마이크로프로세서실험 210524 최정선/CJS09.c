#include <avr/io.h> //OC0������ ������ ��ȣ�� ���, ������ IO���� ����

int main()
{
  
  DDRB=0xff; //OC0�ɿ� ���� ������ ��� ���� ����

  TCCR1A=0xee; //OCR1A: ���-11 , OCR1B: �ϰ�-10, OCR1C: ���-11 WGMn1, WGMn0:10(�������� PWM-�ִ밪1FF)
  TCCR1B=0x05; //�Է�ĸ��:00, WGMn3, WGMn2:00(�������� PWM-�ִ밪1FF), Csn: ���������Ϸ� x1024(101)

  OCR1A= 0x3f; //��� ����ġ 1, �ϰ� ����ġ 0
  OCR1B= 0x3f; //��� ����ġ 0, �ϰ� ����ġ 0
  OCR1C= 0xff; //��� ����ġ 1, �ϰ� ����ġ 0
  
  while(1);

  return 0;
  

}
