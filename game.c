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

//Initialize all game attributes
void initGame() {

    hOff = 0;
    vOff = 0;

    initPlayer();
}

//Update game attributes
void updateGame() {
}

//Draw all game attributes
void drawGame() {

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void initPlayer() {
    health = 3;
}