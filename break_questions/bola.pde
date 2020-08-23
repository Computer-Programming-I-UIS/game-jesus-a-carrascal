class bola {
  int vida,puntuacion;
  float direccion,size ;
  boolean isPush;
  boolean lives , score ;
  
  bola() {
    ellipseMode(RADIUS);
    //x = nx =  width/ 2;
    //y = ny = height / 2;
    size = 10;
    //velocidad = defaultSpeed = 10;
    direccion = 0;
    //aceleracion = 1.05;
    isPush = false;
    lives = false;
    vida =3;
    puntuacion =0;
  }
  
  void actualizar(){
  if(bolax+bolar/2 > width) vx *= -1;
  if(bolax-bolar/2 < 0) vx *= -1;
  if(bolay - bolar/2 <0) vy *= -1;
  
  if (!isPush) {
      if (keyPressed && key == 's')  isPush = true;//s para comenzar
      
      bolax = width / 2;
      bolay = height / 2;
      lives = false;
      //velocidad = defaultSpeed;
      direccion = random(2*PI); //PI/30 * (frameCount % 60);
      return;
  }
  if (keyPressed && key == 'r') { //r para restaurar la bola 
      isPush = false;
      return;
    } 

  if ( bolay > height) { 
      isPush = false; 
      lives = true; 
  }
  if (vida == 0){
    fill(255,0,0);
    text("game over", width / 2 ,height / 2);
    
  }
  }
  void draw(){
   fill(255);
   circle(bolax, bolay, bolar);
   bolax += vx;
   bolay += vy; 
   //stroke(150);
   //arc(bolax, bolay, size*0.8, size*0.8, direccion-PI/6, direccion+PI/6);
  }
 
}
