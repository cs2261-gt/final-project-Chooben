#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "gunSound.h"

//Variables
ANISPRITE player;
int playerHealth;
int damage;
BULLET bullets[BULLETCOUNT];
ENEMY enemies[ENEMYCOUNT];
BOSS boss;
int bossHealth;
int currRegion;
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];

enum{PFRONT, PBACK, PLEFT, PRIGHT, PIDLE};
enum{DOWN, UP, LEFT, RIGHT};
enum{BFRONT, BBACK, BLEFT, BRIGHT, BIDLE};

//Initialize all game attributes
void initGame() {

    //Initialize boss health
    bossHealth = 2;

    hOff = 0;
    vOff = 0;

    initPlayer();
    initBullet();

    initEnemy();

    initBoss();
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

    //Update boss if in boss area
    if(currRegion == 2) {
        boss.active = 1;
        updateBoss();
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

    //Draw boss if in boss area
    if(currRegion == 2) {
        drawBoss();
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
//Initialize player
void initPlayer() {

    player.width = 14;
    player.height = 16;
    player.rdel = 2;
    player.cdel = 2;
    player.worldRow = 20;
    player.worldCol = 20;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = PFRONT;
    playerHealth = 1;
    damage = 1;
}
//Update player movement
void updatePlayer() {

    //Complex player movement
    if(BUTTON_HELD(BUTTON_UP)) {
        if(player.worldRow > 0) {
            player.worldRow-=player.rdel;
        }
        if((vOff >- 0) && (player.screenRow < SCREENHEIGHT/2)) {
            vOff-=2;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if(player.worldRow < MAPHEIGHT - player.height) {
            player.worldRow+=player.rdel;
        }
        if((vOff < MAPHEIGHT - SCREENHEIGHT) && (player.screenRow > SCREENHEIGHT/2)) {
            vOff+=2;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if(currRegion == 1) {
            player.worldCol-=player.cdel;
        } else if(player.worldCol > 0) {
            player.worldCol-=player.cdel;
        }

        if((hOff >= 0) && (player.screenCol < SCREENWIDTH/2)) {
            hOff-=2;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if(player.worldCol < MAPWIDTH - player.width) {
            player.worldCol+=player.cdel;
        }
        if((hOff < MAPWIDTH - SCREENWIDTH) && (player.screenCol > SCREENWIDTH/2)) {
            hOff+=2;
        }        
    }

    //Update player's screen coordinates
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    //Animate player sprite
    animatePlayer();

    //Check player collision with enemy
    for(int i = 0; i < ENEMYCOUNT; i++) {
        if(enemies[i].active == 1) {
            if(collision(player.worldCol, player.worldRow, player.width, player.height, enemies[i].col, enemies[i].row, enemies[i].width, enemies[i].height)) {
                playerHealth--;
            }
        }
    }

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
        bullets[i].del = 3;
        bullets[i].col = 0;
        bullets[i].row = 0;
        bullets[i].direction = DOWN;
        bullets[i].width = 2;
        bullets[i].height = 2;
    }    
}
//Bullet fire logic
void fireBullet() {
    for(int i = 0; i < BULLETCOUNT; i++) {
        if(bullets[i].active == 0) {
            playSoundB(gunSound, GUNSOUNDLEN, 0);
            bullets[i].active = 1;
            if(player.aniState == PFRONT) {
                bullets[i].direction = DOWN;
                bullets[i].col = player.worldCol;
                bullets[i].row = player.worldRow+11;
            } else if(player.aniState == PBACK) {
                bullets[i].direction = UP;
                bullets[i].col = player.worldCol+player.width-1;
                bullets[i].row = player.worldRow+2;
            } else if(player.aniState == PLEFT) {
                bullets[i].direction = LEFT;
                bullets[i].row = player.worldRow+6;
                bullets[i].col = player.worldCol-1;
            } else if(player.aniState == PRIGHT) {
                bullets[i].direction = RIGHT;
                bullets[i].row = player.worldRow+6;
                bullets[i].col = player.worldCol+player.width-1;
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
            if(b->col < 1) {
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

    b->scol = b->col - hOff;
    b->srow = b->row - vOff;
}
//Draw bullets
void drawBullet(BULLET* b) {
    if(b->active) {
        shadowOAM[1].attr0 = (ROWMASK & b->srow) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & b->scol) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_TILEID(8, 0);
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }
}
//Initialize enemies
void initEnemy() {
    for(int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].width = 12;
        enemies[i].height = 15;
        enemies[i].col = (rand() % 240);
        enemies[i].row = (rand() % 160);
        enemies[i].health = 1;
        enemies[i].del = 2;
        enemies[i].direction = rand() % 2;
        enemies[i].active = 1;
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

    e->scol = e->col - hOff;
    e->srow = e->row - vOff;

    //Collision handler for enemy and bullet
    for(int i = 0; i < BULLETCOUNT; i++) {
        if(e->active == 1) {
            if(collision(e->col, e->row, e->width, e->height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
                e->health -= damage;
                bullets[i].active = 0;
            } 
        }
    }

    //Enemy defeated when health equals 0
    if(e->health <= 0)
        e->active = 0;

    //Deactivates enemies if in boss area
    if(currRegion == 2) {
        for(int i = 0; i < ENEMYCOUNT; i++) {
            e->active = 0;
            shadowOAM[100 + i].attr0 = ATTR0_HIDE;
        }
    }
}
//Draw all enemies
void drawEnemy() {
    for(int i = 0; i < ENEMYCOUNT; i++) {
        if(enemies[i].active == 1) {
            shadowOAM[100 + i].attr0 = (ROWMASK & enemies[i].srow) | ATTR0_WIDE;
            shadowOAM[100 + i].attr1 = (COLMASK & enemies[i].scol) | ATTR1_MEDIUM;
            shadowOAM[100 + i].attr2 = ATTR2_TILEID(10, 0);
        } else {
            shadowOAM[100 + i].attr0 = ATTR0_HIDE;
        }
    }
}
//Initialize boss attributes
void initBoss() {
    boss.width = 32;
    boss.height = 32;
    boss.col = 2;
    boss.row = MAPHEIGHT/2 - (boss.width/2);
    boss.cdel = 1;
    boss.rdel = 1;
    boss.width = 32;
    boss.height = 32;
    boss.active = 0;
    boss.curFrame = 0;
    boss.numFrames = 3;
    boss.aniState = BFRONT;
}
//Update boss attributes
void updateBoss() {
    if(boss.col - player.worldCol < 0) {
        boss.cdel = 1;
    } else if(boss.col == player.worldCol) {
        boss.cdel = 0;
    } else {
        boss.cdel = -1;
    }
    if(boss.row - player.worldRow < 0) {
        boss.rdel = 1;
    } else if(boss.row == player.worldRow) {
        boss.rdel = 0;
    } else {
        boss.rdel = -1;
    }

    boss.col+=boss.cdel;
    boss.row+=boss.rdel;

    //Update screen coordinates
    boss.scol = boss.col - hOff;
    boss.srow = boss.row - vOff;

    //Collision handler for boss and bullets
    for(int i = 0; i < BULLETCOUNT; i++) {
        if((bullets[i].active == 1) && (boss.active == 1)) {
            if(collision(boss.col, boss.row, boss.width, boss.height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
                bossHealth-=damage;
                bullets[i].active = 0;
            }
        }
    }

    if(boss.active == 1) {
        if(collision(boss.col, boss.row, boss.width, boss.height, player.worldCol, player.worldRow, player.width, player.height)) {
            playerHealth--;
        }
    }
    animateBoss();
}
//Animate boss sprite
void animateBoss() {
    if(boss.aniCounter % 20 == 0) {
        boss.curFrame = (boss.curFrame + 1) % boss.numFrames;
    }
    boss.aniCounter++;
}
//Draw boss sprite
void drawBoss() {
    shadowOAM[127].attr0 = (ROWMASK & boss.srow) | ATTR0_SQUARE;
    shadowOAM[127].attr1 = (COLMASK & boss.scol) | ATTR1_MEDIUM;
    shadowOAM[127].attr2 = ATTR2_TILEID(boss.aniState + 14, 0+(4*boss.curFrame));
}