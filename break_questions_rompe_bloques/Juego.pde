class Juego {

  //Atributos
  int gseq, golpe;
  int bx=300, by=560, ban=80, bal=20;//barra
  int boan=8, boal=8;//dimenciones de la bola
  int blan=120, blal =30;//dimenciones de los bloques 
  float box, boy, vx, vy;//coordenada de la bola
  float rx, ry;
  int nobloque=0;
  int puntuacion;
  int mcnt;
  int[] bloque =new int[35];//matriz de bloque

  //Constructor
  Juego() {
    noStroke();
    principal();
  }
  // Métodos

  void principal() {
    gseq = 0;
    box = 300;
    boy = 400;
    vx = 2 ;
    vy = 2 ;
    golpe = 0 ;
    for (int i=0; i<35; i++) {
      bloque[i]=1;
    }
    nobloque = 0;
    puntuacion = 0;
    mcnt = 0;
  } 

  void draw() {
    background(255);
    if (gseq == 0 ) {
      inicial();
    } else if ( gseq == 1 ) {
      juego();
    } else {
      gameOver();
    }
  }


  void inicial() {
    bola();
    barra();
    bloques();
    marcador();
  }
  void juego() {
    bola();
    barra();
    bloques();
    marcador();
  }
  void barra() {                      //la barra se mueve y se visualiza 
    fill(0, 0, 100);               //color de la barra
    rect(bx, by, ban, bal, 5);    //dibuja la barra
    bx = mouseX;                 //movimiento de la barra 
    if ( (bx+ban) > width) {
      bx = width- ban;
    }
  }
  void bloques() {                   //en esta parte se muestra los bloques y tambien rompen 
    int xx, yy;
    nobloque = 0;
    for (int i=0; i<35; i++) {     //matrix de los bloques 
      if (bloque[i] == 1) {
        fill(0, 255, 0);
        xx = (i%5)*(blan+2);
        yy = 50+(i/5)*(blal+2);
        romper(i, xx, yy);
        if (bloque[i] == 1) { 
          rect(xx, yy, blan, blal, 2);
          nobloque = 1;
        }
      }
    }
  }
  void romper(int ii, int xx, int yy) {
    if (!((xx<box)&&(xx+ blan > box) && (yy<boy)&&(yy+blal >boy)) ) {//hace que se rompa los bloques 
      return;
    }
    bloque[ii] = 0;
    puntuacion += 10;//aumenta la puntuacion
    if (ii<10) {
      puntuacion += 10;
    }
    if ( (xx<rx)&&(xx+blan > rx) ) {//rebote de la bola al pegar un bloque 
      vy = -vy;//cambio de direccion 
      return;
    }
    if ( (yy <ry)&& (yy+blal> ry) ) {//rebote de la bola al pegar un bloque 
      vx = -vx;//cambio de direccion
      return;
    }
    vx = -vx;//cambio de direccion
    vy = -vy;//cambio de direccion
  } 
  void bola() {      //dibuja la bola  
    rx = box;
    ry = boy;
    box += vx;
    boy += vy;
    if ( boy > height ) {                        //limintes de la bola o rebotes en la pantalla
      gseq=2;
    }
    if (boy < 0) {                              //limintes de la bola o rebotes en la pantalla
      vy = -vy;
    }
    if ( (box < 0 )||(box > width)) {          //limintes de la bola o rebotes en la pantalla
      vx = -vx;
    }
    if ( (golpe == 0)&&(bx < box) &&(bx+ban >box)&&(by < boy)&&(by+bal>boy)) {   //funcion para que golpee la barra 
      vy = -vy;
      golpe = 1;
      if ( nobloque == 0) { // funcion para que se reinice las  barras cuando no hay mas barra
        for (int i=0; i<35; i++) { 
          bloque[i]=1;
        }
        puntuacion += 1;//y da yna puntuacion de 1 cada vez que se reinicia la matriz de bloques
      }
    }
    if ( boy < by-30) {
      golpe=0;
    }
    imageMode(CENTER);
    //fill(0,0,100);
    fill(0, 100, 100);//color de la bola
    ellipse(box, boy, boan, boal);//dibuja la bola 
    imageMode(CORNER);
  }
  void marcador() {   // muestra la puntuacion  
    textSize(22);
    fill(0, 0, 255);
    text("Score:", 460, 24);
    fill(0);
    text(puntuacion, 530, 24);
    textSize(22);
    fill(0, 0, 255);//nombre del juego 
    text("Break Questions", 200, 28);
    fill(0, 0, 255);
    text("Break Questions", 201, 28);
    fill(0, 0, 255); 
    text("Break Questions", 202, 28);
  }
  void gameOver() {//anucio de fin del juego
    barra();
    bloques();
    marcador();
    textSize(50);
    fill(255, 0, 0);
    text("GAME OVER", 160, 400); //aviso que el juego se acabo 
    mcnt++;
    if ((mcnt%60)<40) {
      textSize(20);
      fill(0);
      text("click to retry!", 200, 440);//anucion de reintera el juego
    }
    textSize(22);
    fill(255, 0, 0);//anucios
    text("Break Questions", 280, 84);
    text("Break Questions", 80, 84);
    text("Break Questions", 280, 224);
    text("Break Questions", 80, 224);
    text("Break Questions", 360, 450);
    text("Break Questions", 40, 450);
  }
  void mousePressed() {
    if (gseq==2) {
      principal();
    }
  }
}
