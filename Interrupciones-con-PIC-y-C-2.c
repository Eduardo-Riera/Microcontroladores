#include <16f877.h>					//Incluye en micro a utilizar
#fuses xt,nowdt					//Define los fuses, hs=cristales mayores de 4 MHz, xt=menores de 4 MHz
#use delay(clock=4M)				//Declara la frecuencia de relog para los temporizadores.

#int_rb
void int_rb0()
{
	output_toggle(pin_b0);
	do
	{
	}while((input(pin_b4)=0)||(input(pin_b5)=0)||(input(pin_b6)=0)||(input(pin_b7)=0));
}

void main()
{
	set_tris_b(0b11110000);
	output_high(pin_b0);
	port_b_pullup(true);
	enable_interrupts(int_rb);
	ext_int_edge(h_to_l);
	enable_interrupts(global);
	
	while(true)
	{
		output_high(pin_d0);
		delay_ms(100);
		output_low(pin_d0);
		delay_ms(200);
	}

}