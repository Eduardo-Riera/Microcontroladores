#include <16f877a.h>
#fuses hs.nowdt
#use delay(clock=20M)

int16 i;

void main()
{
	set_tris_b(0b00000000);
	output_b(0b00000000);
	
	while(true)
	{
		for (i=1; i<256; i=i*2)
		{
			output_b(i);
			delay_ms(200);
		}
	}
}