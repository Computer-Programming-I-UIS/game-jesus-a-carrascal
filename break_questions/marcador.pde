class marcador {
  final color defaultBgColor;
  color bgcolor;
  int vida, puntuacion;
  PFont font;
  marcador() {
    textAlign(CENTER);
    textSize(16);
    defaultBgColor = bgcolor = #000000;
    vida = 3;
    puntuacion=0;
  }

  void actualizar(bola bola) {
    if (bola.lives) {
      vida--;
    } else {
      bgcolor = defaultBgColor;
    }
    
   if (bola.score);{
    puntuacion ++;
    }//else {
    //bgcolor=defaultBgColor;
    //}
  }

  void draw() {
    background(255);
    fill(0,0,255);
    text("lives:",22,20 );
    fill(0);
    text(vida, 48, 20);
    fill(0,0,255);
    text("score:",520,20);
    fill(0);
    text(puntuacion,560,20);
    
  }
}
