#include <avr/io.h> //OC0핀으로 디지털 신호를 출력, 디지털 IO방향 설정

int main()
{
  
  DDRB=0xff; //OC0핀에 대한 디지털 출력 방향 설정

  TCCR1A=0xee; //OCR1A: 상승-11 , OCR1B: 하강-10, OCR1C: 상승-11 WGMn1, WGMn0:10(위상정정 PWM-최대값1FF)
  TCCR1B=0x05; //입력캡쳐:00, WGMn3, WGMn2:00(위상정정 PWM-최대값1FF), Csn: 프리스케일러 x1024(101)

  OCR1A= 0x3f; //상승 비교일치 1, 하강 비교일치 0
  OCR1B= 0x3f; //상승 비교일치 0, 하강 비교일치 0
  OCR1C= 0xff; //상승 비교일치 1, 하강 비교일치 0
  
  while(1);

  return 0;
  

}
