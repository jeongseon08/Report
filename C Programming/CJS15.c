//������15*-��������ڿ���
#include <stdio.h>
	void main()
{
//INPUT(�Է�) �������� �� ���� �ʱ�ȭ
int a; //��������������
int b,c; //�������������� 2���߰�
a=17; //���� �ʱ�ȭ
b=4; 
//PROCESS(ó��)
c=a+b; //��� ������ (+)
printf("%d+%d=%d\n", a,b,c);
c=a-b; //���⿬����(-)
printf("%d-%d=%d\n",a,b,c);
c=a*b; //���ϱ⿬����(*)
printf("%d=%dX%d\n",c,a,b);
printf("%d/%d=%d\n",a,b,a/b);//������ ������(/), ������ ������ ������ ����� ���̴�.
c=a%b; //������������(%), �������� ������
printf("%d%%%d=%d\n",a,b,c); //ȭ�鿡 %�� ����ϱ����ؼ��� %%�� ǥ���Ѵ�.
//a(=17)�� b(=4)�� ���� ���� 4, �������� 1�̴�.
printf("%d/%%%d=%d,%d\n",a,b,a/b,a%b);
printf("a(=%d)�� b(=%d)�� ���� ���� %d�̰�, �������� %d�Դϴ�.\n,",a,b,a/b,a%b);
	}