#include<reg51.h>

#define uchar unsigned char
#define uint unsigned int
uchar code table[]="Hello World!";
uchar num;

sbit lcdrs = P2^6;
sbit lcden = P2^7;
sbit lcdwr = P2^5;


void delay(uint z)
{
	uint x,y;
	for(x=z;x>0;x--)
  for(y=110;y>0;y--);
}

void write_command(uchar command)
{
  lcdrs = 0;
	P0=command;
	delay(5);
	lcden=1;
	delay(5);
	lcden=0;
}

void write_data(uchar date)
{
lcdrs=1;
P0=date;
delay(5);
lcden=1;
delay(5);
lcden=0;
}

void show_string(uint line ,uchar *str)            //显示子程序
{
	if(line==1)
	{
		write_command(0x80);
	}
	else
	{
		write_command(0x80+0x40);
	}
	while(*str!='\0')
	{
		write_data(*str++); 
		delay(5);
	}               
             
}

void init_LCD()
{
lcden=0;
lcdwr = 0;
write_command(0x38);//设置16X2显示,5X7点阵,8位数据接口
write_command(0x0C);//设置开显示，不显示光标
write_command(0x06);
write_command(0x01);//显示清零，数据指针清零
}

void init_Timer()
{
	TMOD = 0x01;
	TH0 = 0x3c;
	TL0 = 0xb0;
	EA = 1;
	ET0 = 1;
	
	TR0 = 1;
}
	
uint s0=0x30;
uint s1=0x30;
void main()
{
	init_Timer();
	init_LCD();
	show_string(2,table);

	write_command(0x80);
	write_data(s0);
	write_data(s1);
	
	while(1);	
}

void t0() interrupt 1
{
	static uint i = 0;
	i++;
	if(i>20)
	{
		i=0;
		s1++;
		write_command(0x81);
		write_data(s1);
		if(s1>0x39)
		{
			s1=0x30;
			write_command(0x81);
			write_data(s1);
			s0++;
			write_command(0x80);
			write_data(s0);
		}
		if(s0>0x35)
		{
			s0=0x30;
			write_command(0x80);
			write_data(s0);
		}
	}
}