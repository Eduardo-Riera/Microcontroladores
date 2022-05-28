#include <16f84a.h>					//Incluye en micro a utilizar
#fuses xt,nowdt						//Define los fuses, hs=cristales mayores de 4 MHz, xt=menores de 4 MHz
#use delay(clock=4M)				//Declara la frecuencia de relog para los temporizadores.

void main()
{
	output_low(pin_b0);				//Inicia el pin b0 en cero logico (led apagado).
	while(true)
	{
		output_high(pin_b0);		//Enciende el led
		delay_ms(1000);				//Espera 1seg
		output_low(pin_b0);			//Apaga el led
		delay_ms(2000);				//Espera 2 seg
	}
}