#define CHARLEN 16
#define CHARCOUNT 5

// kitty struct
typedef struct {
	int* bitmap;
	unsigned short furColor;
} CHARACTER;

extern CHARACTER characters[CHARCOUNT];
extern int characterBitmaps[CHARCOUNT];

// prototypes
void initializeCharacters();
void drawCharacter(CHARACTER* character_ptr, int index);