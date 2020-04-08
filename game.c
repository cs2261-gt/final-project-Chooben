#include <stdlib.h>
#include "myLib.h"
#include "game.h"

//Variables
ANISPRITE player;
int health;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
int enemiesRemaining;
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

enum{PFRONT, PBACK, PLEFT, PRIGHT, PIDLE};

//Initialize all game attributes
void initGame() {

    hOff = 0;
    vOff = 0;

    initPlayer();
}
//Update game attributes
void updateGame() {

    updatePlayer();
}
//Draw all game attributes
void drawGame() {

    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
//Initialize player
void initPlayer() {

    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 20;
    player.worldCol = 20;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PFRONT;
    health = 3;
}
//Update player movement
void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if(player.worldRow > 0) {
            player.worldRow-=player.rdel;
        }
        if((vOff >- 0) && (player.screenRow < SCREENHEIGHT/2)) {
            vOff--;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if(player.worldRow < MAPHEIGHT - player.height) {
            player.worldRow+=player.rdel;
        }
        if((vOff < MAPHEIGHT - SCREENHEIGHT) && (player.screenRow > SCREENHEIGHT/2)) {
            vOff++;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if(player.worldCol > 0) {
            player.worldCol-=player.cdel;
        }
        if((hOff >= 0) && (player.screenCol < SCREENWIDTH/2)) {
            hOff--;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if(player.worldCol < MAPWIDTH - player.width) {
            player.worldCol+=player.cdel;
        }
        if((hOff < MAPWIDTH - SCREENWIDTH) && (player.screenCol > SCREENWIDTH/2)) {
            hOff++;
        }        
    }

    //Update player's screen coordinates
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    //Animate player sprite
    animatePlayer();
}
//Player sprite animation
void animatePlayer() {

    player.prevAniState = player.aniState;
    player.aniState = PIDLE;

    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if(BUTTON_HELD(BUTTON_UP))
        player.aniState = PBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        player.aniState = PFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = PLEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = PRIGHT;

    if(player.aniState == PIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}
//Draw player
void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2, player.curFrame*2);
    }
}