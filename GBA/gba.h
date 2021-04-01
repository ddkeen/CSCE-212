//gba.h
//David Keen
#define SCREEN_WIDTH    240 //Top Left is 0,0
#define SCREEN_HEIGHT   160

typedef unsigned char   uint8; //8bits
typedef unsigned short  uint16; //16bits
typedef unsigned int    uint32; //32bits

#define MEM_IO          0x04000000
#define VRAM            0x06000000

#define VIDEOMODE       0x0003
#define BGMODE          0x0400

#define REG_DISPLAY         (*(volatile uint32 *) (MEM_IO))
#define REG_DISPLAY_VCOUNT  (*(volatile uint32 *) (MEM_IO + 0x0006))
#define REG_KEY_INPUT       (*(volatile uint32 *) (MEM_IO + 0x0130))

#define A       1 //first bit
#define B       2 //second bit
#define SELECT  4
#define START   8
#define RIGHT   16
#define LEFT    32
#define UP      64
#define DOWN    128
#define R       256
#define L       512 //10th bit

#define SCREENBUFFER    ((volatile uint16 *) VRAM)

struct Rect { //create a rectangle
    uint32 x, y;
    uint32 w, h;
} a,b,c,d,e,f,g,a2,b2,c2,d2,e2,f2,g2,
  player, player2, ball, ballStart, prevPlayer, prevPlayer2, prevBall;
// my 7 segments









