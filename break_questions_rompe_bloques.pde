
int gseq, golpe;
int bx=300, by=560, ban=40, bal=20;//barra
int boan=12,boal=12;//dimenciones de la bola
int blan=120 , blal =30;//dimenciones de los bloques 
float box,boy,vx,vy;//coordenada de la bola
float rx, ry;
int nobloque=0;
int puntuacion;

int[] bloque =new int[35];//bloque




void setup(){
  size(600,600);
  noStroke();
  //colorMode(HSB,100,100,100);
  principal();
  
}
 void draw(){
   background(255);
  if(gseq == 0 ){
    inicial();
  }else if( gseq == 1 ){
    juego();
  }else{
    gameOver();
  }
}
void principal(){
  gseq = 0;
  box = 300;
  boy = 400;
  vx = 2 ;
  vy = 2 ;
  golpe = 0 ;
  for(int i=0; i<35; i++){
    bloque[i]=1;
  }
  nobloque = 0;
  puntuacion = 0;
  //mcnt = 0;
} 
void inicial(){
  gseq = 1;
  for(int i=0; i<100;i+=10){
    fill(i,100,100);
    ellipse(70+i*3,150,50,50);
  }
}
void juego(){
  bola();
  barra();
  bloques();
  marcador();
}
 void barra(){//la barra se mueve y se visualiza 
    fill(0, 0 ,100);
    rect(bx, by, ban, bal, 5);
    bx = mouseX;
    if( (bx+ban) > width){
      bx = width- ban;
    }
  }
  void bloques(){//en esta parte se muestra los bloques y tambien rompen 
    int xx, yy;
    nobloque = 0;
    for(int i=0; i<35; i++){
      if(bloque[i] == 1){
        fill(0,255,0);
        xx = (i%5)*(blan+2);
        yy = 50+(i/5)*(blal+2);
        romper(i,xx ,yy);
        if(bloque[i] == 1){ 
          rect(xx,yy,blan,blal,2);
          nobloque = 1;
        }
      }
    }
  }
  void romper(int ii,int xx, int yy){
    if(!((xx<box)&&(xx+ blan > box) && (yy<boy)&&(yy+blal >boy)) ){
      return;
    }
    bloque[ii] = 0;
    puntuacion += 10;
    if (ii<10){
      puntuacion += 10;
    }
    if( (xx<rx)&&(xx+blan > rx) ){
      vy = -vy;
      return;
    }
    if( (yy <ry)&& (yy+blal> ry) ){
      vx = -vx;
      return;
    }
    vx = -vx;
    vy = -vy;
  } 
  void bola(){
  rx = box;
  ry = boy;
  box += vx;
  boy += vy;
  if( boy > height ){
   //7 spdy = -spdy;
   gseq=2;
  }
  if (boy < 0){
    vy = -vy;
  }
  if ( (box < 0 )||(box > width)){
    vx = -vx;
  }
  if( (golpe == 0)&&(bx < box) &&(bx+ban >box)&&(by < boy)&&(by+bal>boy)){
    vy = -vy;
    golpe = 1;
    if( nobloque == 0){
      for(int i=0; i<35;i++){
        bloque[i]=1;
      }
      puntuacion += 1;
    }
  }
  if( boy < by-30){
    golpe=0;
  }
  imageMode(CENTER);
  //fill(0,0,100);
  fill(0,100,100);
  ellipse(box,boy,boan,boal);
  imageMode(CORNER);
}
 void marcador(){   // muestra la puntuacion  
    textSize(24);
    fill(0,0,255);
    text("score:",460,20);
    fill(0);
    text(puntuacion,560,20);

   
 }
 void gameOver(){//anucio de fin del juego
  barra();
  bloques();
  marcador();
  textSize(50);
  fill(1,100,100);
  text("GAME OVER",180,400);
  /*mcnt++;
  if((mcnt%60)<40){
    textSize(20);
    fill(20,100,100);
    text("click to retry!",140,360);
  }*/
}
