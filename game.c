#include "gba.h"
#include "game.h"
#include <stdlib.h>
#include "text.h"



// Variables
PlAYER player;
ENEMY enemies[ENEMYCOUNT];
LIFEITEM lifeitem;
AREA area;

// Initiates game each frame
void initGame() {

	score = 0;
	initPlayer();
	initEnemies();
	initLifeItem();
	initArea();
	
}

// Updates game each frame
void updateGame() {

	updatePlayerLife();
	updateLifeItem();
	updatePlayer();
	updateArea();
	
	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateEnemy(&enemies[i]);
	}
	

}
// Draws game each frame
void drawGame() {

	drawBoundary();
	drawRect(50, 140, 20, 10, BLACK);
	drawPlayerLife();
	drawArea();
	drawLifeItem();
	drawPlayer();	
	for (int i = 0; i < ENEMYCOUNT; i++){
		drawEnemy(&enemies[i]);
	}
	

}
// Draws boundary player cannot move and bounce enemies off
void drawBoundary() {

	drawRect(0, 159, 240, 1, COLOR(31, 21, 9)); 
	drawRect(0, 1, 240, 1, COLOR(31, 21, 9));
	drawRect(0, 1, 1, 160, COLOR(31, 21, 9));
	drawRect(239, 1, 1, 160, COLOR(31, 21, 9));

}

// Initiates exclusion area
void initArea(){
	area.col = rand()% 90 + 50;
	area.row = rand()% 90 + 50;
	area.width = 10;
	area.height = 10;
	area.oldCol = SCREENWIDTH / 2;
	area.oldRow = SCREENHEIGHT / 2;
	area.active = 1;
	area.unactive = 0;

}
// Draw exclusion area
void drawArea(){
	
	drawRect(area.oldCol, area.oldRow, area.width,area.height,GOLD);
	
	if(score >= 50){
	 	drawRect(area.oldCol, area.oldRow, area.width, area.height, BLACK);
	 	drawRect(area.col, area.row, area.width, area.height, GOLD);

		
	} 

}
// Updates exclusion area
void updateArea(){
	if(collision(player.col, player.row, player.width, player.height, area.col, area.row, area.width, area.height)){
		area.col = rand()% 90 + 55;
		area.row = rand()% 90 + 55;
		area.width = 10;
		area.height = 10;

	}
}

// Initiates player
void initPlayer() {
	player.row = 140;
	player.col = 80;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.hSpeed = 1;
	player.vSpeed = 1;
	player.height = 13;
	player.width = 8;
	player.color = WHITE;
	player.active = 1;
	player.unactive =0;
	player.life = 3;

}

// Updates player's move
void updatePlayer() {

	if(score >=0 && score < 50){
		if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= 2 && area.active && !(collision(player.col, player.row, player.width, player.height, 
	 area.oldCol +1 , area.oldRow +1 , area.width, area.height)) ) {

		player.col -= player.hSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width + 1 < SCREENWIDTH && !(collision(player.col, player.row, player.width, player.height, 
	 area.oldCol -1 , area.oldRow -1 , area.width, area.height))  ) {

		player.col += player.hSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_UP) 
		&& player.row + player.height >= 16 && !(collision(player.col, player.row, player.width, player.height, 
	 area.oldCol +1 , area.oldRow +1 , area.width, area.height)) ){
		
		player.row -= player.vSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_DOWN) 
		&& player.row + player.height < 159 && !(collision(player.col, player.row, player.width, player.height, 
	 area.oldCol -1 , area.oldRow -1 , area.width, area.height)) ){
		
		player.row += player.vSpeed;
	}

	}

	if(score >=50){

	if (BUTTON_HELD(BUTTON_LEFT)
		&& player.col >= 2 && area.active && !(collision(player.col, player.row, player.width, player.height, 
	 area.col +1 , area.row +1 , area.width, area.height)) ) {

		player.col -= player.hSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player.col + player.width + 1 < SCREENWIDTH && !(collision(player.col, player.row, player.width, player.height, 
	 area.col -1 , area.row -1 , area.width, area.height))  ) {

		player.col += player.hSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_UP) 
		&& player.row + player.height >= 16 && !(collision(player.col, player.row, player.width, player.height, 
	 area.col +1 , area.row +1 , area.width, area.height)) ){
		
		player.row -= player.vSpeed;

	} 
	 else if (BUTTON_HELD(BUTTON_DOWN) 
		&& player.row + player.height < 159 && !(collision(player.col, player.row, player.width, player.height, 
	 area.col -1 , area.row -1 , area.width, area.height)) ){
		
		player.row += player.vSpeed;
	}
	}
	
	
}

// Draws player's appearance according to player's life
void drawPlayer() {

	if(player.life ==4){
		drawPaper3(player.oldCol, player.oldRow, player.width, player.height, BLACK);
		drawPaper3(player.col, player.row, player.width, player.height, player.color);
	}
	if(player.life ==3){
	drawPaper(player.oldCol, player.oldRow, player.width, player.height, BLACK);
	drawPaper(player.col, player.row, player.width, player.height, player.color);
	}

	if(player.life ==2){
	drawPaper1(player.oldCol, player.oldRow, player.width, player.height, BLACK);
	drawPaper1(player.col, player.row, player.width, player.height, player.color);	
	}

	if(player.life ==1){
	drawPaper2(player.oldCol, player.oldRow, player.width, player.height, BLACK);
	drawPaper2(player.col, player.row, player.width, player.height, player.color);	
	}

	player.oldRow = player.row;
	player.oldCol = player.col;
}

// Draws player's life
void drawPlayerLife() {

	
	if(player.life ==4){
		drawHeart(30,30,RED);
		drawHeart(40,30,RED);
		drawHeart(50,30,RED);
		drawHeart(60,30,RED);
	}

	if(player.life ==3){
		drawHeart(30,30,RED);
		drawHeart(40,30,RED);
		drawHeart(50,30,RED);
		drawHeart(60,30,BLACK);
	}

	if(player.life ==2){
		drawHeart(30,30,RED);
		drawHeart(40,30,RED);
		drawHeart(50,30,BLACK);
		drawHeart(60,30,BLACK);
		
	}

	if(player.life ==1){
		drawHeart(30,30,RED);
		drawHeart(40,30,BLACK);
		drawHeart(50,30,BLACK);
		drawHeart(60,30,BLACK);
	}

	
}

// Updates player's life
void updatePlayerLife(){
	for (int i = 0; i < ENEMYCOUNT; i++) {
	if (enemies[i].active && collision(player.row, player.col, player.height, player.width,
				enemies[i].row, enemies[i].col, enemies[i].height, enemies[i].width)) {

			enemies[i].active =0;
			player.life--;
	
			
		}	
					
	}
	
	
}


// Initiates enemies
void initEnemies() {

	for (int i = 0; i < ENEMYCOUNT; i++) {
		enemies[i].height = 1;
		enemies[i].width = 1;
		enemies[i].row = rand() % 110 + 5;
		enemies[i].col = rand() % 130 + 40;
		enemies[i].oldRow = enemies[i].row;
		enemies[i].oldCol = enemies[i].col;
		enemies[i].vSpeed = rand()%2+1;
		enemies[i].hSpeed = rand()%3+1;
		enemies[i].color = COLOR(20, 31, 20);
		enemies[i].active = 1;
		enemies[i].erased = 0;
	}
	
}

// Updates enemies moving
void updateEnemy(ENEMY* e) {

	if (e->active) {

		if (e->row <= 1 || e->row + e->height-1 >= 154){
			e->vSpeed *= -1;
			score++;
		}
		if (e->col <= 2 || e->col + e->width >= 238){
		
			e->hSpeed *= -1;
			score++;
		}
		e->row += e->vSpeed;
		e->col += e->hSpeed;

	}

}

// Draws enemies
void drawEnemy(ENEMY* e) {
	if(e->active) {
		drawF(e->oldCol, e->oldRow, e->width, e->height, BLACK);
		drawF(e->col, e->row, e->width, e->height, e->color);
	} 
	else if (!e->erased) {
		drawF(e->oldCol, e->oldRow, e->width, e->height, BLACK);
		e->erased = 1;
	} 
	e->oldRow = e->row;
	e->oldCol = e->col;
}

// Initiates life item
void initLifeItem() {
	lifeitem.col = rand()% 90 +55;
	lifeitem.row = rand()% 90 +55;
	lifeitem.height = 10;
	lifeitem.width = 11;
	lifeitem.active = 1;
	lifeitem.erased = 0;
}

// Draws life item
void drawLifeItem(){
	if(score >= 50){
		
	drawItem(lifeitem.col, lifeitem.row, lifeitem.width, lifeitem.height,GOLD,RED);
	
	}


	if(lifeitem.active == 0){
	drawItem(lifeitem.col, lifeitem.row, lifeitem.width, lifeitem.height,BLACK,BLACK);

	}
	
}

// Updates player life when player collides with life item
void updateLifeItem(){
	
	if (score >= 50 && lifeitem.active && collision(player.row, player.col, player.height, player.width,
				lifeitem.row, lifeitem.col, lifeitem.height, lifeitem.width) && BUTTON_PRESSED(BUTTON_A)) {
			
			lifeitem.active = 0;
			player.life++;
			
			
	}		

}

