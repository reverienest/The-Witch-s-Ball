# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1







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


extern int gamePhase;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
extern BULLET playerBullets[3];
extern BULLET generalBullets[60];
extern ENEMY enemyPool[10];


void initGame(int phase);
void updateGame();
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
void enemyPatternA();
void enemyPatternB();
void enemyPatternC();
void enemyPatternD();
# 3 "game.c" 2
# 1 "testPlayer.h" 1
# 21 "testPlayer.h"
extern const unsigned short testPlayerTiles[16384];


extern const unsigned short testPlayerPal[256];
# 4 "game.c" 2

OBJ_ATTR shadowOAM[128];
PLAYER player;
BULLET playerBullets[3];
BULLET generalBullets[60];
ENEMY enemyPool[10];


void initGame(int phase) {

    initPlayer();
    initEnemies(phase);
    initBullets(phase);
}


void updateGame() {

 updatePlayer();
}


void drawGame() {

    drawPlayer();

}


void initPlayer() {


    DMANow(3, testPlayerPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, testPlayerTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    player.width = 4;
    player.height = 8;
    player.rdel = 2;
    player.cdel = 2;
    player.bombs = 3;
    player.lives = 5;


    player.row = 160 - 50 - (player.width / 2);
    player.col = 240 / 2 - player.height / 2;
}

void initEnemies(int phase) {

    for (int i = 0; i < 10; i++) {
        enemyPool[i].height = 4;
        enemyPool[i].width = 8;
        enemyPool[i].row = enemyPool[i].height - 1;
        enemyPool[i].col = 0;
        enemyPool[i].rdel = 0;
        enemyPool[i].cdel = 0;
        enemyPool[i].active = 0;
        enemyPool[i].attackType = 0;
        enemyPool[i].movePattern = 0;
        enemyPool[i].tileCol = 2;
        enemyPool[i].tileCol = 0;
    }
}

void initBullets(int phase) {

    for (int i = 0; i < 60; i++) {
        generalBullets[i].height = 4;
        generalBullets[i].width = 4;
        generalBullets[i].row = generalBullets[i].height - 1;
        generalBullets[i].col = 0;
        generalBullets[i].rdel = 0;
        generalBullets[i].cdel = 0;
        generalBullets[i].active = 0;
        generalBullets[i].shotType = 0;
        generalBullets[i].tileCol = 2;
        generalBullets[i].tileCol = 0;
    }


    if (phase == 2) {

    } else if (phase == 3) {

    } else if (phase == 4) {

    } else if (phase == 5) {

    }
}


void updatePlayer() {

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        if (player.row > 0) {


            player.row -= player.rdel;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        if (player.row + player.height < 160) {


            player.row += player.rdel;

        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (player.col > 0) {


            player.col -= player.cdel;
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (player.col + player.width < 240) {


            player.col += player.cdel;
        }
    }
}


void updateEnemy(ENEMY* e) {

 for (int i = 0; i < generalBullets; i++) {
  if (generalBullets[i].active && collision(e->col, e->row, e->width, e->height,
   generalBullets[i].col, generalBullets[i].row, generalBullets[i].width, generalBullets[i].height)) {


   generalBullets[i].active = 0;
            e->active = 0;
        }
    }
}


void updateBullet(BULLET* b) {

}


void drawPlayer() {

    shadowOAM[0].attr0 = (player.row & 0xFF) | (0 << 14);
    shadowOAM[0].attr1 = (player.col & 0x1FF) | (0 << 14);
    shadowOAM[0].attr2 = ((0) << 12) | ((0)*32 + (0));
}


void drawEnemy(ENEMY* e) {

    if (e->active) {
        shadowOAM[1].attr0 = (51 & 0xFF) | (0 << 14);
        shadowOAM[1].attr1 = (23 & 0x1FF) | (0 << 14);
        shadowOAM[1].attr2 = ((0) << 12) | ((e->tileRow)*32 + (e->tileCol));
    } else {
        shadowOAM[1].attr0 = (2 << 8);
    }
}


void enemyAttack(ENEMY* e) {
    if (e->active) {
        if ((e->attackType == 0)) {
           enemyPatternA(e);
        } else if (e->attackType == 1) {
            enemyPatternB(e);
        }
    }
}


void enemyPatternA(ENEMY* e) {

 for (int i = 0; i < 60; i++) {
  if ((!generalBullets[i].active) && (generalBullets[i].shotType == 0)) {


   generalBullets[i].row = e->row + e->height;
   generalBullets[i].col = e->col + player.width/2
   - generalBullets[i].width/2;


   generalBullets[i].active = 1;


   break;
  }
 }
}


void enemyPatternB(ENEMY* e) {

    int count= 0;

 while (count < 8) {
        for (int i = 0; i < 60; i++) {
      if ((!generalBullets[i].active) && (generalBullets[i].shotType == 1)) {


       generalBullets[i].row = e->row + e->height/2;
       generalBullets[i].col = e->col + player.width/2
       - generalBullets[i].width/2;

                switch (count) {
                    case 0:
                        generalBullets[i].rdel = 1;
                        generalBullets[i].cdel = 0;
                        break;
                    case 1:
                        generalBullets[i].rdel = 1;
                        generalBullets[i].cdel = 1;
                        break;
                    case 2:
                        generalBullets[i].rdel = 0;
                        generalBullets[i].cdel = 1;
                        break;
                    case 3:
                        generalBullets[i].rdel = -1;
                        generalBullets[i].cdel = 1;
                        break;
                    case 4:
                        generalBullets[i].rdel = -1;
                        generalBullets[i].cdel = 0;
                        break;
                    case 5:
                        generalBullets[i].rdel = -1;
                        generalBullets[i].cdel = -1;
                        break;
                    case 6:
                        generalBullets[i].rdel = 0;
                        generalBullets[i].cdel = -1;
                        break;
                    case 7:
                        generalBullets[i].rdel = 1;
                        generalBullets[i].cdel = -1;
                        break;
                }


       generalBullets[i].active = 1;


       break;
      }
     }
    }

}


void enemyPatternC(ENEMY* e) {

}


void enemyPatternD(ENEMY* e) {

}
