#include "gba.h"
#include "game.h"
#include "text.h"
#include <stdlib.h>
#include <stdio.h>
#include "character.h"



void initialize();
void goToStart(), goToGame(), goToPause(), goToWin(), goToLose();
void startState(), gameState(), pauseState(), winState(), loseState();
void soundEffect();


enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int seed;

CHARACTER characters[CHARCOUNT];

u32 songLength;
u16 note = 0;
u32 playing = 0;

typedef struct noteWithDuration {
  u16 note;      
  u16 duration;  
} NoteWithDuration;

NoteWithDuration song[] = {
    {REST, 60},
    {NOTE_C4, 15},
    {NOTE_C4, 30},
    {NOTE_G4, 15},
    {NOTE_A4, 15},
    {NOTE_A4, 30},
    {NOTE_A4, 60},
    {NOTE_A4, 60},
    {NOTE_A4, 15},
    {NOTE_A4, 20},
    {NOTE_G4, 30},
    {NOTE_F4, 15},
    {NOTE_F4, 40},
    {NOTE_G4, 30},
    {NOTE_A4, 30},
    {NOTE_D4, 30},
    {NOTE_A4, 30},
    {NOTE_G4, 15},
    {NOTE_F4, 30},
    {NOTE_D4, 15},
    {NOTE_F4, 30},
    {NOTE_F4, 30},
    {NOTE_F4, 15},
    {NOTE_F4, 30},
    {NOTE_G4, 15},
    {NOTE_F4, 30},
    {NOTE_F4, 60},

    {NOTE_C4, 30},
    {NOTE_C4, 30},
    {NOTE_C4, 30},
    {NOTE_C4, 40},
    {NOTE_D4, 15},
    {NOTE_D4, 30},
    {NOTE_E4, 15},
    {NOTE_F4, 30},
    {NOTE_C4, 30},
    {NOTE_C4, 30},
    {NOTE_D4, 15},
    {NOTE_D4, 15},
    {NOTE_E4, 30},
    {NOTE_F4, 40},
    {NOTE_F4, 30},
    {NOTE_G4, 15},
    {NOTE_A4, 15},
    {NOTE_G4, 15},
    {NOTE_F4, 15},
    {NOTE_D4, 15},
    {NOTE_F4, 15},
    {NOTE_F4, 30},
    {NOTE_F4, 30},
    {NOTE_G4, 15},
    {NOTE_A4, 15},
    {NOTE_G4, 15},
    {NOTE_F4, 15},
    {NOTE_D4, 15},
    {NOTE_C4, 30},
    {NOTE_G4, 15},
    {NOTE_F4, 15},
    {NOTE_C4, 40},
    
};

u32 songLength = sizeof(song) / sizeof(NoteWithDuration);


int main() {

    initialize();


    while(1) {
        
        soundEffect();
            

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
            case(START):
                startState();
                break;
            case(GAME):
                gameState();
                break;
            case(PAUSE):
                pauseState();
                break;
            case(WIN):
                winState();
                break;
            case(LOSE):
                loseState();
                break;
        }
    }
}

void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // Enable sound (Master control)
    REG_SOUNDCNT_X = SND_ENABLED;

    // Master sound controls for DMG (GameBoy) Sound Generators
    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                    DMG_VOL_RIGHT(5) |
                    DMG_SND1_LEFT |
                    DMG_SND1_RIGHT |
                    DMG_SND2_LEFT |
                    DMG_SND2_RIGHT |
                    DMG_SND3_LEFT |
                    DMG_SND3_RIGHT |
                    DMG_SND4_LEFT |
                    DMG_SND4_RIGHT;

    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    

    goToStart();
}


void soundEffect(){
    u16 drumR = 0;
    u16 drumS = 7;
    for(int i = 0; i < ENEMYCOUNT; i++){
        if (enemies[i].active && collision(player.row, player.col, player.height, player.width,
				enemies[i].row, enemies[i].col, enemies[i].height, enemies[i].width)) {  
        REG_SND4CNT = DMG_ENV_VOL(15) | 1 << 12 ; 
        REG_SND4FREQ = DMG_FREQ_TIMED | 1 << 15 | drumR | drumS << 4 | 1 << 3;
        drumR = (drumR + 1) % 8;
        }
     }
    if (BUTTON_PRESSED(BUTTON_LEFT) || BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_PRESSED(BUTTON_UP) || BUTTON_PRESSED(BUTTON_DOWN)){ // play the song normally
            if (song[note].note != REST) {
            REG_SND2CNT = DMG_ENV_VOL(15) | DMG_DIRECTION_DECR | DMG_STEP_TIME(7) | DMG_DUTY_50;
            REG_SND2FREQ = song[note].note | SND_RESET | DMG_FREQ_TIMED;
            }
            note++;
            if (note >= songLength) {
            note = 0;
            }
    }
    if (BUTTON_PRESSED(BUTTON_A)){  
            if (song[note].note != REST) {
                REG_SND1CNT = DMG_ENV_VOL(15) | DMG_DIRECTION_DECR | DMG_STEP_TIME(7) | DMG_DUTY_50;
                REG_SND1FREQ = song[note].note | SND_RESET | DMG_FREQ_TIMED;
                REG_SND1SWEEP = DMG_SWEEP_NUM(7) | DMG_SWEEP_STEPTIME(7) | DMG_SWEEP_DOWN;
            }
                note++;
            if (note >= songLength) {
             note = 0;
            }
        }
}
void goToStart() {
    fillScreen(BLACK);
    state = START;
    seed = 0;
    drawString((240 - (18 * 6)) / 2,0,"press SELECT to play", GOLD);
    drawString((240 - (12 * 6)) / 2,100,"Run To A Game", GOLD);
    initializeCharacters();
    for (int i = 0; i < CHARCOUNT; i++) {
            drawCharacter(&characters[i], i);
    }
    
}
void startState() {
    seed ++;
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void goToGame() {
    fillScreen(BLACK);
    state = GAME;
    

}

void gameState() {
    updateGame();
    sprintf(buffer,"%u",score);
    waitForVBlank();
    drawGame();
    drawString(10,140,"score:" ,WHITE);
    drawString(50,140,buffer,WHITE);

    
    if(player.life == 0){
    
        goToLose();
    
    }

    if(score >= 300){
        goToWin();
    }

    
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
   

}



void goToPause() {
    fillScreen(BLUE);
    state = PAUSE;
    drawString((240 - (5 * 6)) / 2,5,"Pause",GOLD);

}

void pauseState() { 
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    state = WIN;
    drawString((240 - (7 * 6)) / 2,5,"You win!",BLACK);

}

void winState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
    drawString((240 - (7 * 6)) / 2,5,"You Lose!",GOLD);
    sprintf(buffer,"%u",score);
    drawString(50,140,buffer,WHITE);
	drawString(10,140,"score:" ,WHITE);
    

}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}