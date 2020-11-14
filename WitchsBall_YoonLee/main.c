/*
    Author: Yoon Lee

    notes:
    -I really wanted to do more with the milestone but this past week has seriously been pushing me back. 
    -State transitions and all state screens should work, though player movement is not implemented, at least not in the game loop (Ran into issues testing). 
    -Bullets and enemy waves are also not yet in, but will be as soon as possible. 
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "startscn.h"
#include "instrscn.h"
#include "gamescn.h"
#include "pausescn.h"
#include "winscn.h"
#include "losescn.h"


// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INSTR,
    GAME,
    //STAGE
    //BOSS1
    //BOSS2
    //BOSS3
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    hideSprites();
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTR:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    //set up the display
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    buttons = BUTTONS;
    oldButtons = 0;
     
    goToStart();
}

// Sets up the start state
void goToStart() {
    // Sets up the start background
    DMANow(3, startscnPal, PALETTE, 256);
    DMANow(3, startscnTiles, &CHARBLOCK[0], startscnTilesLen / 2);
    DMANow(3, startscnMap, &SCREENBLOCK[28], startscnMapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 512);

    state = START;
}

// Runs every frame of the start state
void start() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame(state);
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

//Sets up the instructions state
void goToInstructions() {
    waitForVBlank();
    flipPage();

    state = INSTR;
}

//Runs every frame of the instructions state
void instructions() {

    hideSprites();

    // Sets up the instructions background
    DMANow(3, instrscnPal, PALETTE, 256);
    DMANow(3, instrscnTiles, &CHARBLOCK[0], instrscnTilesLen / 2);
    DMANow(3, instrscnMap, &SCREENBLOCK[28], instrscnMapLen / 2);

    waitForVBlank();

        // State transitions
    if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the game state
void goToGame() {
    // Sets up the game background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, gamescnPal, PALETTE, 256);
    DMANow(3, gamescnTiles, &CHARBLOCK[0], gamescnTilesLen / 2);
    DMANow(3, gamescnMap, &SCREENBLOCK[28], gamescnMapLen / 2);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    //Copy the shadowOAM into the OAM
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToWin();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    waitForVBlank();
    flipPage();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {

    hideSprites();

    // Sets up the pause background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, pausescnPal, PALETTE, 256);
    DMANow(3, pausescnTiles, &CHARBLOCK[0], pausescnTilesLen / 2);
    DMANow(3, pausescnMap, &SCREENBLOCK[28], pausescnMapLen / 2);

    waitForVBlank();

    //state transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    waitForVBlank();
    flipPage();

    state = WIN;
}

// Runs every frame of the win state
void win() {

    hideSprites();

    // Sets up the win background
    DMANow(3, winscnPal, PALETTE, 256);
    DMANow(3, winscnTiles, &CHARBLOCK[0], winscnTilesLen / 2);
    DMANow(3, winscnMap, &SCREENBLOCK[28], winscnMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    waitForVBlank();

    //state transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {
    waitForVBlank();
    flipPage();
    
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {

    hideSprites();

    // Sets up the lose background
    DMANow(3, losescnPal, PALETTE, 256);
    DMANow(3, losescnTiles, &CHARBLOCK[0], losescnTilesLen / 2);
    DMANow(3, losescnMap, &SCREENBLOCK[28], losescnMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    waitForVBlank();

    //state transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}