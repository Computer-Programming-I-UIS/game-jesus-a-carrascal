import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//import ddf.minim.signals.*;
//import ddf.minim.spi.*;
//import ddf.minim.ugens.*;

float bolax, bolay, bolar;
float vx, vy;
float barraw = 100, barrah = 30;
boolean is_alive[][] =new boolean[6][8];

bola bola;
marcador marcador;
bloques bloques;
//float bloquew = 100, bloqueh = 30;
void setup(){
  size(600,600);
  bolax = 250;
  bolay = 250;
  bolar = 22;
  vx = 3;
  vy = -4;
  frameRate(30);
  for(int i=0;i<6;i++){
    for(int j=1;j<8;j++){
      is_alive[i][j] = true;
    }
   }
  bola =new bola();
  marcador =new marcador();
  bloques = new bloques();
}
void draw(){
  background(255);//
  bola.actualizar();
  marcador.actualizar(bola);
  
  marcador.draw();
  bola.draw();
  bloques.draw();
  
  
  
  fill(255,0,0);
  rect(mouseX, 460, barraw, barrah);
  
  if((bolax + bolar/2 > mouseX && bolax - bolar/2 < mouseX+barraw) 
    &&(460 < bolay + bolar/2 && bolay + bolar/2 < 460+barrah)){
    vy *= -1;
  }
 }
