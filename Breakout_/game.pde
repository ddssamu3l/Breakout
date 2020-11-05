void game(){
   background(#84C6F7);
   theme.rewind();
   if(lives<=0 || score>=alive.length)
     mode = gameOver;
     
    if(pkey == true)
      mode = pause;
   int count = 0;
   for(int y = 0; y<arry.length; y++){ // drawing targets
       for(int x = 0; x<arrx.length; x++){
         if(alive[count]){
          manageBricks(x, y, count);
         }
         count++;
       }  
    }
    
   //prints out lives and score
   String s = Integer.toString(score);
   String l = Integer.toString(lives);
   fill(255);
   textFont(dance);
   text("score:  ", 100, height-100);
   text("lives:", width-150, height-100);
   textFont(num);
   text(s, 175, height-100);
   text(l, width-60, height-100);
   fill(255);
   circle(paddlex, paddley, paddled);
   circle(ballx, bally, balld);
   
   if(dist(ballx, bally, paddlex, paddley)<=balld/2+paddled/2){ // collide with slider
     collide(); 
   }
  if(ballx<=5){vx*=-1;} // bouncing off boarders of window
  else if(ballx>=width-5){vx*=-1; bounce.rewind();bounce.play();}
  else if(bally<=5){vy*=-1;bounce.rewind(); bounce.play();}
  else if(bally>=height+100){
     lives-=1;
     ballx = width/2;
     bally = height/2;
     vx = 0;
     vy = 3;
     death.rewind();
     death.play();
  }
  // control paddle
  if(akey&&paddlex>=0+paddled/2 ) paddlex-=4;
  if(dkey && paddlex<=width-paddled/2)paddlex+=4;
  
   ballx+=vx;
  bally+=vy;
}


//manages bricks
void manageBricks(int x, int y, int count){
    if(y == 0){fill(#DE1929);}
           else if(y == 1){fill(#DE8519);}
           else if(y == 2){fill(#E5CE17);}
           else if(y == 3){fill(#73E517);}
           else if(y == 4){fill(#009DF0);}
          circle(arrx[x], arry[y], 50); 
        if(dist(ballx, bally, arrx[x], arry[y])<=balld/2+25){
          alive[count] = false;
          score++;
          vx = (ballx-arrx[x])/5;
          vy = (bally-arry[y])/5; 
          scores.rewind();
          scores.play();
        }
}
