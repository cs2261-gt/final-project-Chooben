#include "mylib.h"

//Prototypes

//Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    while(1) {
        
        oldButtons = buttons;
        buttons = BUTTONS;
    }
}