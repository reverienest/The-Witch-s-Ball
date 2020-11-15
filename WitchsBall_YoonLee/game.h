// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256
#define ENEMYSHOT 60
#define PLAYERSHOT 3
#define ENEMYCOUNT 10

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniTimer;
	int numFrames;
	int tileCol;
	int tileRow;
	int direction;
    int bulletTimer;
    int cDirection;
    int bombs;
    int lives;
} PLAYER;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int shotType;
	int aniTimer;
	int numFrames;
	int tileCol;
	int tileRow;
	int active;
	int origin;
} BULLET;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniTimer;
	int numFrames;
	int tileCol;
	int tileRow;
	int spellCard;
    int health;
} BOSS;

typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int width;
	int height;
	int aniTimer;
	int numFrames;
	int tileCol;
	int tileRow;
	int active;
	int movePattern;
    int attackType;
} ENEMY;

// Variables
extern int gamePhase;
extern int enemiesRemaining;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
extern BULLET playerBullets[PLAYERSHOT];
extern BULLET generalBullets[ENEMYSHOT];
extern ENEMY enemyPool[ENEMYCOUNT];

// Prototypes
void initGame(int phase);
void updateGameStage(int state);
void updateGamePhase1(int state);
void updateGamePhase2(int state);
void updateGamePhase3(int state);
void drawGame();
void initPlayer();
void initEnemies(int phase);
void initBullets(int phase);
void updatePlayer();
void updateEnemy(ENEMY* e);
void updateBullet(BULLET* b);
void drawPlayer();
void drawEnemy(ENEMY* e);
void drawBullet(BULLET* b);
void playerFire();
void enemyPatternA();
void enemyPatternB();
void enemyPatternC();
void enemyPatternD();