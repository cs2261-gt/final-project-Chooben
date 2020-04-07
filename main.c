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

//Run through whole game
int main() {

    initialize();

    while(1) {
        
        //Update buttons
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
        initGame();
    }
}
//Setup game
void goToGame(){

    waitForVBlank();

    state = GAME;
}
//Game logic
void game(){

    updateGame();
    drawGame();

    //Go to pause screen
    if(BUTTON_PRESSED(BUTTON_START))
        goToPause();
    //Loss condition
    if(player.health == 0)
        goToLose();
}   
//Setup pause menu
void goToPause(){

    waitForVBlank();

    state = PAUSE;
}
//Pause menu logic
void pause(){

    waitForVBlank();

    //Go back to game from pause
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    //Restart game from pause
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}
//Setup win screen
void goToWin(){

    state = WIN;
}
//Win screen
void win(){

    waitForVBlank();

    //Restart game from win
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

//Setup lose screen
void goToLose(){

    state = LOSE;
}
//Lose screen
void lose(){

    waitForVBlank();

    //Restart game from loss
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}