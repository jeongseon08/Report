//������19***-���� ������ ����
#include<stdio.h>
void main()
{
int a,b,c; //��������������
a=10;
b=0, c=0; //���� �ʱ�ȭ
printf("a=%d,b=%d,c=%d\n",a,b,c);
b=a++;
//����(��ġ)����������, a���� b�� ������ �� a �ڽ��� ���� 1��ŭ ������Ų��.
printf("a=%d,b=%d,c=%d\n",a,b,c);
a=10,b=0,c=0;
printf("a=%d,b=%d,c=%d\n",a,b,c);
b=++a;
//����(��ġ) ����������, a���� 1��ŭ ������Ų������ b�� ����
printf("a=%d,b=%d,c=%d\n",a,b,c);
a=10,b=0,c=0;
b=a++;
c=++a;
printf("a=%d,b=%d,c=%d\n",a,b,c);
}