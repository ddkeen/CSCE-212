//gba.h

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

#define DIR UP 0
#define DIR RIGHT 1
#define DIR DOWN 2
#define DIR LEFT 3

#define MAX_LENGTH 30

#define SCREENBUFFER  ((volatile unit))
//didn't get the rest, get online






