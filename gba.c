#include "gba.h"
#include "text.h"

// The start of the video memory
unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;


// ---- Miscellaneous Functions ----

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA <= rowB + heightB - 1 && rowA + heightA - 1 >= rowB && colA <= colB + widthB - 1 && colA + widthA - 1 >= colB;
}

void waitForVBlank() {
    while (SCANLINECOUNTER >= 160);
    while (SCANLINECOUNTER < 160);
}


// ---- Mode 3 ----

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, color);
        }
    }
}

void drawPaper(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, BLACK);
    drawLine(col+1, row +3, 6, BLACK);
    drawString(col, row +5, "A", RED);
    
}

void drawPaper1(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, BLACK);
    drawLine(col+1, row +3, 6, BLACK);
    drawString(col, row +5, "A", RED);
    setPixel(col+7,row+4, BLACK);
    setPixel(col+7,row+5, BLACK);
    setPixel(col+7,row+6, BLACK);
    setPixel(col+7,row+7, BLACK);
    setPixel(col+6,row+4, BLACK);
    setPixel(col+6,row+5, BLACK);
    setPixel(col+6,row+6, BLACK);
    setPixel(col+6,row+7, BLACK);
    setPixel(col+5,row+5, BLACK);
    setPixel(col+5,row+6, BLACK);

}

void drawPaper2(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, BLACK);
    drawLine(col+1, row +3, 6, BLACK);
    drawString(col, row +5, "A", RED);
    setPixel(col+7,row+4, BLACK);
    setPixel(col+7,row+5, BLACK);
    setPixel(col+7,row+6, BLACK);
    setPixel(col+7,row+7, BLACK);
    setPixel(col+6,row+4, BLACK);
    setPixel(col+6,row+5, BLACK);
    setPixel(col+6,row+6, BLACK);
    setPixel(col+6,row+7, BLACK);
    setPixel(col+5,row+5, BLACK);
    setPixel(col+5,row+6, BLACK);
    setPixel(col, row+12, BLACK);
    setPixel(col, row+11, BLACK);
    setPixel(col, row+10, BLACK);
    setPixel(col, row+9, BLACK);
    setPixel(col+1, row+10, BLACK);
    setPixel(col+1, row+12, BLACK);
    setPixel(col+2, row+12, BLACK); 
    setPixel(col+1, row+11, BLACK);   
}

void drawPaper3(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, BLACK);
    drawLine(col+1, row +3, 6, BLACK);
    drawString(col, row +5, "A", RED);
    setPixel(col+5,row+2,RED);
    setPixel(col+5,row+3,RED);
    setPixel(col+5,row+4,RED);
    setPixel(col+4,row+3,RED);
    setPixel(col+6,row+3,RED);
    

}


void drawF(int col, int row, int width, int height, unsigned short color){
    for(int i =0; i < height; i++){
        for(int j=0; j< width; j++){
    setPixel(col+i,row+j,color);
    setPixel(col+i+1,row+j,color);
    setPixel(col+i,row+j+1,color);
    setPixel(col+i,row+j+2,color);
    setPixel(col+i,row+j+3,color);
    setPixel(col+i+1,row+j+3,color);
    setPixel(col+i,row+j+4,color);
    setPixel(col+i,row+j+5,color);
        }
    }

}

void fillScreen(unsigned short color) {
    for(int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }
}

void drawLine(int col, int row,int length,unsigned short color) {  
  for(int i=0; i<length; i++){
    setPixel(col +i, row, color);  
  }
}

void drawHeart(int col, int row, unsigned short color) {
    setPixel(col, row, color);
    setPixel(col+2, row, color);
    drawLine(col-1,row+1,5,color);
    drawLine(col,row+2,3,color);
    setPixel(col+1,row+3,color);
    
}

void drawItem(int col, int row, int width, int height, unsigned short color1, unsigned short color2){
    drawRect(col, row, width,height, color1);
    setPixel(col+4, row+3, color2);
    setPixel(col+6, row+3, color2);
    drawLine(col+3,row+4,5,color2);
    drawLine(col+4,row+5,3,color2);
    setPixel(col+5,row+6,color2);
	
}
