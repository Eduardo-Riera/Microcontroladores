#include <16f877.h>					//Incluye en micro a utilizar
#fuses xt,nowdt					//Define los fuses, hs=cristales mayores de 4 MHz, xt=menores de 4 MHz
#use delay(clock=4M)				//Declara la frecuencia de relog para los temporizadores.

#int_ext
void int_rb0()
{
	output_toggle(pin_b7);
}

void main()
{
	set_tris_b(0b00000001);
	output_low(pin_b7);
	port_b_pullup(true);
	enable_interrupts(int_ext);
	ext_int_edge(h_to_1);
	enable_interrupts(global);
	
	while(true)
	{
		
	}

}