//Bullet struct
typedef struct {
    int col;
    int row;
    int scol;
    int srow;
    int width;
    int height;
    int del;
    int active;
    int direction;
}BULLET;

//Enemy struct
typedef struct {
    int col;
    int row;
    int scol;
    int srow;
    int width;
    int height;
    int del;
    int active;
}ENEMY;

typedef struct {
    int col;
    int row;
    int scol;
    int srow;
    int rdel;
    int cdel;
    int width;
    int height;
    int active;
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
#define ENEMYCOUNT 5


//Variables
extern ANISPRITE player;
extern int playerHealth;
extern int damage;
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
void initBoss();
void updateBoss();
void animateBoss();
void drawBoss();