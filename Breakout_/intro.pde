void intro (){
    background(#123593);
    gg.rewind();
    theme.play();
    score = 0;
    lives = 3;
    image(gif[play], 0, 0, width, height);
    play++;
    if(play>=frameNum-1)
      play = 0;
    strokeWeight(5);
    
    //resetting balls
    alive = new Boolean[arrx.length*arry.length];
      for(int x = 0; x<arrx.length*arry.length; x++)
        alive[x] = true;
        
     // resetting paddles
      paddlex = width/2;
  paddley = height;
  paddled = 150;
  fill(0);
  textAlign(CENTER , CENTER);
  textSize(72);
  textFont(dance);
  fill(255);
  for(int x = 50; x<height-50; x+=50){
  text("BREAKOUT" , width/2, x);
  }

}
void introClicks(){
    mode = game;
}
