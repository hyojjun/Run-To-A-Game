# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

char buffer[41];






int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
void waitForVBlank();
# 44 "gba.h"
extern volatile unsigned short *videoBuffer;
# 72 "gba.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawF(int col, int row, int width, int height, unsigned short color);
void drawLine(int col, int row,int length,unsigned short color);
void drawHeart(int col, int row, unsigned short color);
void drawItem(int col, int row, int width, int height, unsigned short color1, unsigned short color2);
void drawPaper(int col, int row, int width, int height, unsigned short color);
void drawPaper1(int col, int row, int width, int height, unsigned short color);
void drawPaper2(int col, int row, int width, int height, unsigned short color);
void drawPaper3(int col, int row, int width, int height, unsigned short color);
# 102 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 179 "gba.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;
# 2 "gba.c" 2
# 1 "text.h" 1

void drawChar(int col, int row, char ch, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
# 3 "gba.c" 2


unsigned volatile short *videoBuffer = (unsigned short *)0x6000000;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA <= rowB + heightB - 1 && rowA + heightA - 1 >= rowB && colA <= colB + widthB - 1 && colA + widthA - 1 >= colB;
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}




void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row) * (240) + (col))] = color;
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
    drawLine(col+1, row +1, 6, 0);
    drawLine(col+1, row +3, 6, 0);
    drawString(col, row +5, "A", ((31) | (0)<<5 | (0)<<10));

}

void drawPaper1(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, 0);
    drawLine(col+1, row +3, 6, 0);
    drawString(col, row +5, "A", ((31) | (0)<<5 | (0)<<10));
    setPixel(col+7,row+4, 0);
    setPixel(col+7,row+5, 0);
    setPixel(col+7,row+6, 0);
    setPixel(col+7,row+7, 0);
    setPixel(col+6,row+4, 0);
    setPixel(col+6,row+5, 0);
    setPixel(col+6,row+6, 0);
    setPixel(col+6,row+7, 0);
    setPixel(col+5,row+5, 0);
    setPixel(col+5,row+6, 0);

}

void drawPaper2(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, 0);
    drawLine(col+1, row +3, 6, 0);
    drawString(col, row +5, "A", ((31) | (0)<<5 | (0)<<10));
    setPixel(col+7,row+4, 0);
    setPixel(col+7,row+5, 0);
    setPixel(col+7,row+6, 0);
    setPixel(col+7,row+7, 0);
    setPixel(col+6,row+4, 0);
    setPixel(col+6,row+5, 0);
    setPixel(col+6,row+6, 0);
    setPixel(col+6,row+7, 0);
    setPixel(col+5,row+5, 0);
    setPixel(col+5,row+6, 0);
    setPixel(col, row+12, 0);
    setPixel(col, row+11, 0);
    setPixel(col, row+10, 0);
    setPixel(col, row+9, 0);
    setPixel(col+1, row+10, 0);
    setPixel(col+1, row+12, 0);
    setPixel(col+2, row+12, 0);
    setPixel(col+1, row+11, 0);
}

void drawPaper3(int col, int row, int width, int height, unsigned short color){
    drawRect(col, row, width, height, color);
    drawLine(col+1, row +1, 6, 0);
    drawLine(col+1, row +3, 6, 0);
    drawString(col, row +5, "A", ((31) | (0)<<5 | (0)<<10));
    setPixel(col+5,row+2,((31) | (0)<<5 | (0)<<10));
    setPixel(col+5,row+3,((31) | (0)<<5 | (0)<<10));
    setPixel(col+5,row+4,((31) | (0)<<5 | (0)<<10));
    setPixel(col+4,row+3,((31) | (0)<<5 | (0)<<10));
    setPixel(col+6,row+3,((31) | (0)<<5 | (0)<<10));


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
    for(int i = 0; i < 240 * 160; i++) {
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
