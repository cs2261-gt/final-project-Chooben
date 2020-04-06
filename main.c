#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

//Prototypes
void initialize();

void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

//States
enum{START, GAME, PAUSE, WIN, LOSE};
int state;

//Variables
unsigned short buttons;
unsigned short oldButtons;

int seed;

int main() {

    while(1) {
        
        oldButtons = buttons;
        buttons = BUTTONS;

        //State machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

//Setup game
void initialize() {

    REG_DISPCTL = MODE0;

    goToStart();
}

//Setup start menu
void goToStart(){

    seed = 0;

    state = START;
}
//Start menu logic
void start(){

    seed++;

    waitForVBlank();

    //Go to game state
    if(BUTTON_PRESSED(BUTTON_START)) {

        srand(seed);

        goToGame();
    }
}
//Setup game
void goToGame(){

    state = GAME;
}
//Game logic
void game(){

    if(BUTTON_PRESSED(BUTTON_START))
        goToPause();
    if(player.health == 0)
        goToLose();
}   
//Setup pause menu
void goToPause(){
    state = PAUSE;
}
//Pause menu logic
void pause(){}
//Setup win screen
void goToWin(){
    state = WIN;
}
//Win screen
void win(){
}
//Setup lose screen
void goToLose(){

    state = LOSE;
}
//Lose screen
void lose(){
}