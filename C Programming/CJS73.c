//������73-�Ϲݺ����� ������ ���� ����
#include<stdio.h>
void main()
{
int a; //�Ϲݺ���, ���� ����뵵
int*b; //�����ͺ�������, �ּ�(Address)������뵵
a=77; //������ ������ �ʱ�ȭ
b=&a; //����a�� �ּҷ� �ʱ�ȭ
printf("�Ϲݺ���a�� ��=%d\n",a);//�Ϲݺ����� ���� ���������� �˼��ִ�.
printf("�Ϲݺ���a�� �ּ�=%x\n",&a); //�Ϲݺ����� �ּҴ� ������ �տ� '&'��ȣ(�ּҿ�����)�� �ٿ��� ��Ÿ����.
printf("�����ͺ���b�� ��=%x\n",b);//������ �������� �ּҰ� ����Ǿ��ִ�.
printf("�����ͺ���b�� �ּ�=%x\n",&b); //�����ͺ����� �������̹Ƿ��ڽ��� �ּҸ� �������ִ�.
}