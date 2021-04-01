//main.c

#include "gba.h"
#include <stdbool.h>

void sync()
{
	while (REG_DISPLAY_VCOUNT >= 160);
	while (REG_DISPLAY_COUNT < 160);
}
uint16 makeColor(uint8 r, uint8 g, uint8 b)
{
	return (r & 0x1f) | ((g & 0x1f) << 5) | (b & 0x1f) << 10);
}
void drawRect(struct Rect rect)
{
	for(int y=0; y<rect.h; y++)
	{
		for(int x=0; x<rect.w;x++)
		{
			SCREENBUFFER[(rect.y + y) * SCREEN_WIDTH + rect.x + x] = 0xffff; = color;
		}
	}
}
void clear7seg()
{
	drawRect(a, makeColor(0,0,0));
	drawRect(b, makeColor(0,0,0));
	drawRect(c, makeColor(0,0,0));
	drawRect(d, makeColor(0,0,0));
	drawRect(e, makeColor(0,0,0));
	drawRect(f, makeColor(0,0,0));
	drawRect(g, makeColor(0,0,0));
}

void draw7seg(uint8)
{
	clear7seg();
	bool w,x,y,z;
	
	w = (num >= 8 ? ((num-=8) ? 1 : 1) : 0);
	x = (num >= 8 ? ((num-=4) ? 1 : 1) : 0);
	y = (num >= 8 ? ((num-=2) ? 1 : 1) : 0);
	z = (num >= 8 ? ((num-=1) ? 1 : 1) : 0);
	
	if(w || y || (!x && z))
		drawRect(a, makeColor(0x1f, 0x1f, 0x1f));
	if((y && z) || (!y && !z) || !x)
		drawRect(b, makeColor(0x1f, 0x1f, 0x1f));
	if(x || !y ||z)
		drawRect(c, makeColor(0x1f, 0x1f, 0x1f));
	if(w || (y && !z) || (!x && !z) || (y
		

void init7sef()
{
	a.w = 16;
	a.h = 4;
	f.w = 4;
	f.h = 16;
	
	b = c = e = f;
	d = g = a;
	
	a.x = d.x = e.x = f.x = g.x = SCREEN_WIDTH/4;
	b.x = c.x = a.x + a.w;
	
	a.y = b.y = f.y = 0;
	c.y = e.y = g.y = b.y + b.h - a.h;
	d.y = g.y + b.h - a.h;
}
	
int main()
{
	REG_DISPLAY = VIDEOMODE | BGMODE;
	
	a.x = 50;
	a.y = 40;
	a.w = 40;
	a.h = 100;
	while(1)
	{
		//...do...code...
		sync();
		draw7seg(val)
		
		drawRect(player, makeColor(0,0x1f,0));
		
		
		drawRect(a);
		drawRect(b);
		drawRect(c);
		drawRect(d);
		drawRect(e);
		drawRect(f);
		drawRect(g);
		
	}
	