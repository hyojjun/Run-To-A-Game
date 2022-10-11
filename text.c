#include "gba.h"
#include "text.h"
#include "font.h"

void drawChar(int col, int row, char ch, unsigned short color) {
    for(int i=0; i<8; i++) {
        for(int j=0; j<6; j++) {
            if (fontdata_6x8[48*ch + OFFSET(j,i,6)]) {
                setPixel(row + j, col + i, color);
            }
        }
    }

}

void drawString(int col, int row, char *str, unsigned short color) {
    while(*str!= '\0')
    {
        drawChar(row, col, *str, color);
        col +=6;
        str++;

    }
    
}