//������ 28-���������α׷�
#include<stdio.h>
void main()
{	
int y; //��������������, ������ �Է¹��� ����
int r; //���� �Ǵܰ���� ������ ����
printf("������ �Է��Ͻʽÿ�:");
scanf("%d",&y); //scanf()�Լ����� �ݵ�� �������տ� �ּҿ������� '&'��ȣ�� �ٿ�����.
r=(((y%4==0)&&(y%100!=0))||(y%400==0)); //�����̶� 4�� ����������� 100���� ������ ���������ʰų� 400���� ������ �������� ����̴�.
printf("%d���� %d�Դϴ�(��,0:����ƴ�, 1:����)\n",y,r);
}