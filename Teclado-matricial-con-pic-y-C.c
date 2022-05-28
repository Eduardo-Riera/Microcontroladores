#include <16f877.h>					//Incluye en micro a utilizar
#fuses xt,nowwdt					//Define los fuses, hs=cristales mayores de 4 MHz, xt=menores de 4 MHz
#use delay(clock=4M)				//Declara la frecuencia de relog para los temporizadores.
#define lcd_data_port getenv("sfr:portd")
#define lcd_enable_pin pin_d0
#define lcd_rs_pin pin_d1
#define lcd_rw_pin pin_d2
#define use_portb_kbd true
#include <lcd.c>
#include <kbd.c>

void main()
{
	char k;
//	int x;
	port_b_pullup(true);
	lcd_init();
	kbd_init();
		while(true)
		{
			k=kbd_getc();
//			x=k-48;
			if(k!=0)
			{
				lcd_gotoxy(1,1);
				printf(lcd_putc, "tecla pulsada: %c, k);
//				printf(lcd_putc, "tecla pulsada: %u, x);		//Para obtener el valor del caracter pulsado.
			}
		}
}