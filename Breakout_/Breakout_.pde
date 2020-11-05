import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

AudioPlayer theme, bounce, scores, death, gg;

PImage [] gif;
int frameNum;
int play;

float ballx, bally, balld;
float paddlex, paddley, paddled;
int mode;
int intro;
int game;
int pause;
int gameOver;
float vx, vy;
int score, lives;
float textSizee, textChange;

int arrx[];
int arry[];

boolean akey, dkey, pkey = false;
Boolean [] alive;

PFont dance;
PFont num;

void setup(){
  background(180);
  size(1000, 1000);
  
  ballx = width/2;
  bally = height/2;
  balld = 10;
 
  // initialize speed
  vx = 0;
  vy = 3;
  
  // initialize modes
  intro = 1;
  game = 2;
  pause = 3;
  gameOver = 4;
  mode = intro;
  
  // score displayer
  dance = createFont("fire.otf", 70);
  num = createFont("numbers.ttf", 70);
   
   // initialize array
   arrx = new int [5];
   arry = new int[4];
   
   int i = 0;
    for(int  y =100; i<4; y+=120){
      arry[i] = y;
      i++;
    }
    i = 0;
    for(int x = 100; i<5; x+=200){
          arrx[i] = x;
          i++;
      } 
       // initialize score and lives
       score = 0;
       lives = 3;
       
    // initialize gif
    frameNum = 30;
    gif = new PImage [frameNum];
    
    for(int x = 0; x<frameNum; x++){
         gif[x] = loadImage("frame_"+x+"_delay-0.03s.gif");
    }
    // initialize sound
     minim = new Minim(this);
   theme = minim.loadFile("utf-8''intro.wav");
   bounce =minim.loadFile("utf-8''boop.wav");
   scores = minim.loadFile("utf-8''beep.wav");
   death = minim.loadFile("utf-8''break.wav");
   gg = minim.loadFile("utf-8''win.wav");
}

void draw() {
    if(mode == game){ // game
       game();
   }
   else if(mode == pause){ // pause
      pause(); 
   }
   else if(mode == gameOver){ // gameOver
      gameOver(); 
   }
   else if(mode == intro){
     intro();
   }  
}
void mouseReleased(){
   if(mode == intro)
     introClicks();
   if(mode == gameOver)
     mode = intro;
}
