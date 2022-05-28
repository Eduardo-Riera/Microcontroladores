#include <16f877a.h>
#fuses hs.nowdt
#use delay(clock=20M)

int8 unid[10]={63,6,91,79,102,109,125,7,127,103};
int8 i;

void main()
{
	set_tris_b(0b00000000);
	output_b(unid=0);
	
	while (true)
	{
		for (i=0; i<10; i++)
		{
			output_b(unid[i]);
			delay_ms(500);
		}
	}	



}