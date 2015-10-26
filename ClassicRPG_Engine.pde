int blocksize = 16;
int[][] map1;
color wall;
color floor;
color error;
color player;
int playerpos[] = new int[2];

void setup(){
  size(720,720); //x and y should be the same.
  int mapsize = 720/blocksize; //if reselution changed up one line, change here too. 720 to new res.
  map1 = new int[mapsize][mapsize];
  
  wall = color(75); //Setting colors
  floor = color(#5FBC09);
  error = color(#CE0FC5);
  player = color(#FFAB03);
  
  for(int i = 0; i < map1.length; i=i+1){
    for(int o = 0; o < map1.length; o=o+1){
      map1[i][o] = 0; //Make Ground
      
      map1[0][o] = 1; //Make Walls Around Map
      map1[i][0] = 1;
      map1[44][o] = 1;
      map1[i][44] = 1;
    }
  }
  
  playerpos[0] = round(mapsize/2);
  playerpos[1] = round(mapsize/2);
}

void draw(){
  GraphicsSystem();
  //debug();
}



void GraphicsSystem(){
  background(0);
    for(int i = 0; i < map1.length; i=i+1){
      for(int o = 0; o < map1.length; o=o+1){
        
        if(playerpos[0] == i && playerpos[1] == o){
          map1[i][o] = 2;
        }
        
        if(map1[i][o] == 0){
          fill(floor);
        } else if(map1[i][o] == 1){
          fill(wall);
        } else if(map1[i][o] == 2){
          fill(player);
        } else{fill(error); }
        rect(i*16,o*16,16,16); //Draws blocks.
      }
    }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if(map1[playerpos[0]][playerpos[1]-1] == 0 ){
        
        map1[playerpos[0]][playerpos[1]] = 0; 
        playerpos[1] = playerpos[1]-1;
      }
    }
    if (keyCode == DOWN) {
      if(map1[playerpos[0]][playerpos[1]+1] == 0){
        
        map1[playerpos[0]][playerpos[1]] = 0; 
        playerpos[1] = playerpos[1]+1;
      }
    }
    if (keyCode == RIGHT) {
      if(map1[playerpos[0]+1][playerpos[1]] == 0){
        
        map1[playerpos[0]][playerpos[1]] = 0; 
        playerpos[0] = playerpos[0]+1;
      }
    }
    if (keyCode == LEFT) {
      if(map1[playerpos[0]-1][playerpos[1]] == 0){
        
        map1[playerpos[0]][playerpos[1]] = 0; 
        playerpos[0] = playerpos[0]-1;
      }
    }
  }
}


void debug(){
  fill(#A2DFFF);
  text("x : "+playerpos[0],1,10);
  text("y : "+playerpos[1],1,22);
  text("FPS: "+frameRate,1,35);
  
  map1[1][2] = 1;
  map1[1][1] = 1; 
  map1[2][2] = 1;
  map1[3][4] = 1;
  map1[3][5] = 1;
  map1[4][6] = 1;
}
