//Bullet struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int damage;
    int del;
    int active;
    int direction;
}BULLET;

//Enemy struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int health;
    int del;
    int direction;
    int active;
}ENEMY;

typedef struct {
    int col;
    int row;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} BOSS;

//Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256
#define BULLETCOUNT 1
#define ENEMYCOUNT 2


//Variables
extern ANISPRITE player;
extern int playerHealth;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern BOSS boss;
extern int bossHealth;
extern int currRegion;
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];

//Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void animatePlayer();
void initBullet();
void fireBullet();
void updateBullet();
void drawBullet();
void initEnemy();
void updateEnemy();
void drawEnemy();
void initboss();
void updateBoss();
void animateBoss();
void drawBoss();