//������16*-���迬���ڿ���
#include<stdio.h>
void main()
{
int a,b,c; //������ ���� ����
a=100; //���� �ʱ�ȭ
b=200;
printf("%d==%d�� ����� %d\n",a,b,a==b);
//2������ ���� �������� �Ǵ��ϴ� ���迬���ڴ� ==�� ����Ѵ�.
printf("%d!=%d\n",a,b,a!=b); //������������ �Ǵ��ϴ� ���迬���ڴ� !=�� ����Ѵ�.
printf("%d>%d:%d\n",a,b,c=a>b);
printf("%d<=%d:%d\n",a,b,c=a<b);//���� �������� ����� �� (1) �Ǵ� ����(0)
printf("%d=%d:%d\n",a,b,a=b);//'='���� �����ڴ� ������ �� �Ǵ� ������ ����� ������ ������ �����Ѵ� ��,a=(b=200) ���Կ������̴�.
printf("(%d+%d)>(%dx%d)?%d\n",a,b,a,b,(a+b)>(a*b));
}