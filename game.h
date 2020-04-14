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

//Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256
#define BULLETCOUNT 1
#define ENEMYCOUNT 2


//Variables
extern ANISPRITE player;
extern int health;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int enemiesRemaining;
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