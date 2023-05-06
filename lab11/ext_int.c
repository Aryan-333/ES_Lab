#include <LPC17xx.h>
int main (void)
{
LPC_PINCON->PINSEL4=1<<24;
LPC_GPIO0->FIODIR=0x00000FF0;
LPC_SC->EXTMODE=4;// the third bit is set to 1 then it is edge triggered 0 and and its ilevel trigger
LPC_SC->EXTPOLAR=0;// the third bit is set to 1 then it is positive edge or positive level and if it is 0 then it is negative edge triggered. and by default the button is kept as 1.
NVIC_EnableIRQ(EINT2_IRQn);
while(1);

}
void EINT2_IRQHandler(void)
{
	int i;
LPC_GPIO0->FIOPIN=~LPC_GPIO0->FIOPIN;
for(i=0;i<100000;i++);
LPC_SC->EXTINT=1;
}
