//������77-�Լ�ȣ��� �Ű����� ����(Call by value ���� ����)
#include <stdio.h>
void abc(int,int); //(2)�Լ������, �Ű������� ���������� int(����)���̰�, ���ϰ��� �����Ƿ� void ������ ����
void main()
{
int a,b; //������ ��������
a=100; //���� �ʱ�ȭ
b=200;
printf("�ʱ��� a=%d, b=%d\n", a,b);
abc(a,b); //�Լ�ȣ���, �Ű����� 2���� ������
printf("�Լ�ȣ���� a=%d, b=%d\n", a,b);
}
void abc(int x, int y) //(3)�Լ����Ǻ�, main()�Լ��κ��� ���޵� �Ű����� a.b�� �����Ǵ� ���������� x,y�� �������ش�.
{
int tmp; //������ ������������ (������ �ӽú�������)
tmp =x;
x=y;
y=tmp; //2���� ���� ��ȯ�ϴ� ���
} 
//�ּҳ� �������� �����ʾ�  a��b�� ��ȯ�����ʽ��ϴ�. ���� 78���� �����ϰڽ��ϴ�.