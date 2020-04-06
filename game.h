//Player struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int health;
}PLAYER;

//Bullet struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
}BULLET;

//Enemy struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
}ENEMY;

//Constants
#define BULLETCOUNT 2
#define ENEMYCOUNT 6

//Variables
extern PLAYER player;
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