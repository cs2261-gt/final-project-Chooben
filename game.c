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
enum{DOWN, UP, LEFT, RIGHT};

//Initialize all game attributes
void initGame() {

    hOff = 0;
    vOff = 0;

    initPlayer();
    initBullet();
    initEnemy();
}
//Update game attributes
void updateGame() {

    //Update player movement
    updatePlayer();

    //Update bullet movement
    for(int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullets[i]);
    }

    //Update enemy movement
    for(int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemies[i]);
    }
}
//Draw all game attributes
void drawGame() {

    //Draw player
    drawPlayer();

    //Draw bullets
    for(int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }

    //Draw enemies
    drawEnemy();

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

    //Player fires bullet
    if(BUTTON_PRESSED(BUTTON_A)) {
        fireBullet();
    }
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

//Initialize bullet(s)
void initBullet() {
    for(int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].active = 0;
        bullets[i].del = 2;
        bullets[i].col = 0;
        bullets[i].row = 0;
        bullets[i].damage = 1;
        bullets[i].direction = DOWN;
        bullets[i].width = 16;
        bullets[i].height = 16;
    }    
}
//Bullet fire logic
void fireBullet() {
    for(int i = 0; i < BULLETCOUNT; i++) {
        if(bullets[i].active == 0) {
            bullets[i].active = 1;
            if(player.aniState == PFRONT) {
                bullets[i].direction = DOWN;
                bullets[i].col = player.screenCol;
                bullets[i].row = player.screenRow;
            } else if(player.aniState == PBACK) {
                bullets[i].direction = UP;
                bullets[i].col = player.screenCol;
                bullets[i].row = player.screenRow;
            } else if(player.aniState == PLEFT) {
                bullets[i].direction = LEFT;
                bullets[i].row = player.screenRow;
                bullets[i].col = player.screenCol;
            } else if(player.aniState == PRIGHT) {
                bullets[i].direction = RIGHT;
                bullets[i].row = player.screenRow;
                bullets[i].col = player.screenCol;
            }
        }
    }
}
//Update bullets
void updateBullet(BULLET*b) {
    if(b -> active) {
        if(b->direction == DOWN) {
            if(b->row > MAPHEIGHT) {
                b->active = 0;
            } else {
                b->row += b->del;
            }
        } else if(b->direction == UP) {
            if(b->row < 0) {
                b->active = 0;
            } else {
                b->row -=b->del;
            }
        } else if(b->direction == LEFT) {
            if(b->col < 0) {
                b->active = 0;
            } else {
                b->col -= b->del;
            }
        } else {
            if(b->col > MAPWIDTH) {
                b->active = 0;
            } else {
                b->col += b->del;
            }
        }
    }
}
//Draw bullets
void drawBullet(BULLET* b) {
    if(b->active) {
        shadowOAM[1].attr0 = b->row | ATTR0_SQUARE;
        shadowOAM[1].attr1 = b->col | ATTR1_SMALL;
        if(b->direction == UP || b->direction == DOWN) {
            shadowOAM[1].attr2 = ATTR2_TILEID(8, 0);
        } else {
            shadowOAM[1].attr2 = ATTR2_TILEID(10, 0);
        }
    }
}
//Initialize enemies
void initEnemy() {
    for(int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].width = 16;
        enemies[i].height = 16;
        enemies[i].col = 50;
        enemies[i].row = 50;
        enemies[i].health = 1;
        enemies[i].del = 1;
        enemies[i].direction = rand() % 2;
    }
}
//Update enemies
void updateEnemy(ENEMY* e) {
    //Boundary checks
    if(e->col < 1 || ((e->col + e->width) > (MAPWIDTH - 1))) {
        e->del *= -1;
    } else if(e->row < 1 || ((e->row + e->height) > (MAPHEIGHT - 1))) {
        e->del *= -1;
    }

    //Update enmey
    if(e->direction == 0) {
        e->col += e->del;
    } else {
        e->row += e->del;
    }
    
}
//Draw all enemies
void drawEnemy() {
    for(int i = 0; i < ENEMYCOUNT; i++) {
        if(enemies[i].health != 0) {
            shadowOAM[100 + i].attr0 = enemies[i].row | ATTR0_SQUARE;
            shadowOAM[100 + i].attr1 = enemies[i].col | ATTR1_SMALL;
            shadowOAM[100 + i].attr2 = ATTR2_TILEID(12, 0);
        }
    }
}