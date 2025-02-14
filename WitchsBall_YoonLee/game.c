#include "myLib.h"
#include "game.h"
#include "testPlayer.h"

OBJ_ATTR shadowOAM[128];
PLAYER player;
BULLET playerBullets[PLAYERSHOT];
BULLET generalBullets[ENEMYSHOT];
ENEMY enemyPool[ENEMYCOUNT];

// Initialize the game
void initGame(int phase) {

    initPlayer();
    initEnemies(phase);
    initBullets(phase);
}

// Updates the game each frame in the stage level
void updateGameStage(int state) {

	updatePlayer();
}

// Updates the game each frame in boss phase 1
void updateGamePhase1(int state) {

	updatePlayer();
}

// Updates the game each frame in boss phase 2
void updateGamePhase2(int state) {

	updatePlayer();
}

// Updates the game each frame in boss phase 3
void updateGamePhase3(int state) {

	updatePlayer();
}

// Draws the game each frame
void drawGame() {

    drawPlayer();

}

// Initialize the player
void initPlayer() {

    //set up player sprites
    DMANow(3, testPlayerPal, SPRITEPALETTE, testPlayerPalLen / 2);
    DMANow(3, testPlayerTiles, &CHARBLOCK[4], testPlayerTilesLen / 2);

    player.width = 4;
    player.height = 8;
    player.rdel = 2;
    player.cdel = 2;
    player.bombs = 3;
    player.lives = 5;
    player.bulletTimer = 20;

    // Place at the bottom of the screen
    player.row = SCREENHEIGHT - 50 - (player.width / 2);
    player.col = SCREENWIDTH / 2 - player.height / 2;
}

void initEnemies(int phase) {
    //initializes enemies
    for (int i = 0; i < ENEMYCOUNT; i++) {
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
    //initializes player bullets
    for (int i = 0; i < PLAYERSHOT; i++) {
            playerBullets[i].height = 4;
            playerBullets[i].width = 4;
            playerBullets[i].row = playerBullets[i].height - 1;
            playerBullets[i].col = 0;
            playerBullets[i].rdel = 0;
            playerBullets[i].cdel = 0;
            playerBullets[i].active = 0;
            playerBullets[i].shotType = 0;
            playerBullets[i].tileCol = 2;
            playerBullets[i].tileCol = 0;
            playerBullets[i].active = 0;
            playerBullets[i].origin = 0;
        }

    if (phase == 2) {
        for (int i = 0; i < ENEMYSHOT; i++) {
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
            generalBullets[i].active = 0;
            generalBullets[i].origin = 1;
        }
    } else if (phase == 3) {

    } else if (phase == 4) {

    } else if (phase == 5) {

    }
}

// Handle every-frame actions of the player
void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if (player.row > 0) {

            // Update player's world position if the above is true
            player.row -= player.rdel;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (player.row + player.height < 160) {

            // Update player's world position if the above is true
            player.row += player.rdel;

        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (player.col > 0) {

            // Update player's world position if the above is true
            player.col -= player.cdel;
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.col + player.width < 240) {

            // Update player's world position if the above is true
            player.col += player.cdel;
        }
    }

    // Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 15) {

		fireBullet();
		player.bulletTimer = 0;
	}
    player.bulletTimer++;

 // Handle enemy-bullet collisions
	for (int i = 0; i < generalBullets; i++) {
		if (generalBullets[i].active  && collision(player.col, player.row, player.width, player.height,
			generalBullets[i].col, generalBullets[i].row, generalBullets[i].width, generalBullets[i].height)) {

			// Put bullet in pool & lose a life
			generalBullets[i].active = 0;
            player.lives--;
        }
    }
}

//Handle every-frame actions of the enemies
void updateEnemy(ENEMY* e) {
    // Handle enemy-bullet collisions
	for (int i = 0; i < playerBullets; i++) {
		if (playerBullets[i].active  && collision(e->col, e->row, e->width, e->height,
			playerBullets[i].col, playerBullets[i].row, playerBullets[i].width, playerBullets[i].height)) {

			// Put bullet & enemy back in the pool
			playerBullets[i].active = 0;
            e->active = 0;
            enemiesRemaining--;
        }
    }
}

//Handle every-frame actions of the bullets
void updateBullet(BULLET* b) {
    // If active, act
	if (b->active) {
		if (b->row + 1 >= 0) {
			b->row += b->rdel;

		} else {
			b->active = 0;
		}
	}
}

// Draw the player
void drawPlayer() {

    shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 0);
}

//draws enemies
void drawEnemy(ENEMY* e) {

    if (e->active) {
        shadowOAM[1].attr0 = (51 & ROWMASK) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (23 & COLMASK) | ATTR1_TINY;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(e->tileCol, e->tileRow);
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }
}

//player firing mode.
void playerFire() {
    // Find the first inactive bullet
	for (int i = 0; i < PLAYERSHOT; i++) {
		if (!playerBullets[i].active) {

			// Position the new bullet
			playerBullets[i].row = player.row;
			playerBullets[i].col = player.col + player.width/2
				- playerBullets[i].width/2;

			// Take the bullet out of the pool
			playerBullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

//logic for determining enemy behavior.
void enemyAttack(ENEMY* e) {
    if (e->active) {
        if ((e->attackType == 0)) {
           enemyPatternA(e);
        } else if (e->attackType == 1) {
            enemyPatternB(e);
        }
    } 
}

//a single bullet attack.
void enemyPatternA(ENEMY* e) {
 // Find the first inactive bullet of type 0
	for (int i = 0; i < ENEMYSHOT; i++) {
		if ((!generalBullets[i].active) && (generalBullets[i].shotType == 0)) {

			// Position the new bullet
			generalBullets[i].row = e->row + e->height;
			generalBullets[i].col = e->col + player.width/2
			- generalBullets[i].width/2;

			// Take the bullet out of the pool
			generalBullets[i].active = 1;

			// Break out of the loop
			break;
		}
	}
}

//a blast attack that fires all around the enemy.
void enemyPatternB(ENEMY* e) {
    
    int count= 0;
    // Find the first inactive bullet of type 0 (to be 1)
	while (count < 8) {
        for (int i = 0; i < ENEMYSHOT; i++) {
		    if ((!generalBullets[i].active) && (generalBullets[i].shotType == 1)) {

			    // Position the new bullet
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

			    // Take the bullet out of the pool
			    generalBullets[i].active = 1;

			    // Break out of the loop
			    break;
		    }
	    }
    }

}

//a wave attack that fires in front of the enemy.
void enemyPatternC(ENEMY* e) {
    
}

//a large shot that splits into multiple bullets.
void enemyPatternD(ENEMY* e) {
    
}