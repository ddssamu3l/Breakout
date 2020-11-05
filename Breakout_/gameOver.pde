void gameOver(){
  theme.rewind();
  gg.play();
    background(255, 0, 0);
    image(gif[play], 0, 0, width, height);
    if(play>=frameNum-1)
      play = 0;
    play++;
    textFont(dance);
    text("game over", width/2, height/2-200);
    text("score:", width/2-30, height/2);
     if(score== 20)
       text("YOU WIN", width/2-50, height/2-400);
     else
       text("YOU LOST", width/2, height/2-400);
        textFont(num);
        text(Integer.toString(score), width/2+70, height/2);
        
    

}
