int score;

// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int hSpeed;
	int vSpeed;
	int height;
	int width;
	unsigned short color;
	int active;
	int unactive;
	int life;
} PlAYER;


// Exclusion area Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	unsigned short color;
	int active;
	int unactive;
	
} AREA;

//ITEM struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} LIFEITEM;


// Enemy Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int vSpeed;
	int hSpeed;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} ENEMY;



// Constants
#define ENEMYCOUNT 10

// Variables
extern PlAYER player;
extern LIFEITEM lifeitem;
extern AREA area;
extern ENEMY enemies[ENEMYCOUNT];


void initGame();
void updateGame();
void drawGame();
void drawBoundary();
void initPlayer();
void updatePlayer();
void drawPlayer(); 
void initEnemies();
void updateEnemy(ENEMY *);
void drawEnemy(ENEMY *);
void drawPlayerLife();
void updatePlayerLife();
void initLifeItem();
void drawLifeItem();
void updateLifeItem();
void initArea();
void drawArea();
void updateArea();

