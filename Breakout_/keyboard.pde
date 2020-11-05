void keyPressed(){
   if(key == 'a')
     akey = true;
   if(key == 'd')
     dkey = true;
   if(key == 'p')
     pkey=!pkey;
}
void keyReleased(){
   if(key == 'a')
     akey = false;
   if(key == 'd')
     dkey = false;
}
