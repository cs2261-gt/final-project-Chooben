#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "startScreen.h"
#include "region1.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "spritesheet.h"
#include "region2.h"

//Prototypes
void initialize();

void goToStart();
void start();
void goToGame1();
void game1();
void goToGame2();
void game2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

//States
enum{START, GAME1, GAME2, PAUSE, WIN, LOSE};
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
            case GAME1:
                game1();
                break;
            case GAME2:
                game2();
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

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_SMALL;

    buttons = BUTTONS;

    goToStart();
}

//Setup start menu
void goToStart(){

    seed = 0;

    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = START;
}
//Start menu logic
void start(){

    seed++;

    waitForVBlank();

    //Go to game state
    if(BUTTON_PRESSED(BUTTON_START)) {

        srand(seed);

        goToGame1();
        initGame();
    }
}
//Setup game
void goToGame1(){

    waitForVBlank();

    //Setup game background
    DMANow(3, region1Pal, PALETTE, 256);
    DMANow(3, region1Tiles, &CHARBLOCK[0], region1TilesLen/2);
    DMANow(3, region1Map, &SCREENBLOCK[31], region1MapLen/2);    

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, & CHARBLOCK[4], spritesheetTilesLen/2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    state = GAME1;
}
//Game logic
void game1(){

    updateGame();
    drawGame();

    //Go to pause screen
    if(BUTTON_PRESSED(BUTTON_START))
        goToPause();
    //Loss condition
    if(health == 0)
        goToLose();
    if(player.worldCol < 0)
        goToGame2();
}   
//Setup region 2
void goToGame2() {
    waitForVBlank();

    //Setup game background
    DMANow(3, region2Pal, PALETTE, 256);
    DMANow(3, region2Tiles, &CHARBLOCK[0], region2TilesLen/2);
    DMANow(3, region2Map, &SCREENBLOCK[31], region2MapLen/2);    

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, & CHARBLOCK[4], spritesheetTilesLen/2);

    player.worldCol = MAPWIDTH - player.width;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    state = GAME2;

}
//Region 2
void game2() {

    updateGame();
    drawGame();

    //Go to pause screen
    if(BUTTON_PRESSED(BUTTON_START))
        goToPause();
    //Loss condition
    if(health == 0)
        goToLose();
}
//Setup pause menu
void goToPause(){

    waitForVBlank();

    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}
//Pause menu logic
void pause(){

    waitForVBlank();

    hideSprites();

    //Go back to game from pause
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame1();
    //Restart game from pause
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
    else if (BUTTON_PRESSED(BUTTON_B))
        goToLose();
    else if (BUTTON_PRESSED(BUTTON_A))
        goToWin();
}
//Setup win screen
void goToWin(){

    waitForVBlank();

    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen/2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen/2);

    
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

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

    waitForVBlank();

    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen/2);

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = LOSE;
}
//Lose screen
void lose(){

    waitForVBlank();

    //Restart game from loss
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}