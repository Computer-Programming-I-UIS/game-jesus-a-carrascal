class Juego {

  //Atributos
  int preguntas=1;
  int gseq, golpe;
  int bx=300, by=560, ban=80, bal=20;//barra
  int boan=8, boal=8;//dimenciones de la bola
  int blan=120, blal =30;//dimenciones de los bloques 
  float box, boy, vx, vy;//coordenada de la bola
  float rx, ry;
  int nobloque=0;
  int puntuacion;
  int mcnt;
  float aceleracion, direccion ;
  int[] bloque = new int[35];//matriz de bloque

  int bloquesDestruidos = 0;
  int cantidadPreguntas = 15;
  int[] posRandom = new int[cantidadPreguntas];
  boolean preguntando = false;

  //Constructor
  Juego() {
    noStroke();
    principal();
    //Llenar el vector de posiciones con valores aleatoreos.
    for (int i = 0; i < cantidadPreguntas; i++) {                   ///////////////////////////NUEVO
      posRandom[i] = int(random(1, 35));
    }
  }
  // Métodos
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
        fill((i/5)*15, 255, 255);
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


  void preguntar() {
    //pausar la bola 
    preguntando = true;                                   ///////////////////////////NUEVO
    
    //hace las preguntas espera a que responda el usuario
    
    //if(/*usuario repondio*/) preguntando = false;              ///////////////////////////NUEVO
  }

  void romper(int ii, int xx, int yy) {
    if (!((xx<box)&&(xx+ blan > box) && (yy<boy)&&(yy+blal >boy)) ) {//hace que se rompa los bloques 
      return;
    }
    bloquesDestruidos++;//pausar el                                   ///////////////////////////NUEVO
    for (int i = 0; i < cantidadPreguntas; i++) {
      if (bloquesDestruidos == posRandom[i]) preguntar();
    }
    bloque[ii] = 0;
    puntuacion += 10;//aumenta la puntuacion
    if (ii<10) {
      puntuacion += 10;
    }
    if ( (xx<rx)&&(xx+blan > rx) ) {//rebote de la bola al pegar un bloque 
      vy = -vy;//cambio de direccion 
      sonido_impactoB.trigger();
      return;
    }
    if ( (yy <ry)&& (yy+blal> ry) ) {//rebote de la bola al pegar un bloque 
      vx = -vx;//cambio de direccion
      sonido_impactoB.trigger();
      return;
    }
    vx = -vx;//cambio de direccion
    vy = -vy;//cambio de direccion
  } 

  void bola() {      //dibuja la bola  
    aceleracion = 1.08;
    direccion = random(0.2*PI);
    rx = box;
    ry = boy;
    if (!preguntando) {                           ///////////////////////////NUEVO
      box += vx;
      boy += vy;
    }
    if(preguntando == true){
    println("Debo hacer una pregunta!");
    fill(255,0,0);
    rect(100, 300, 400, 150);
    //
    textSize(15);
    fill(0);
    text("Oprima 'V' si es verdadera y 'F' si es falsa", width*0.5, height* 0.55);
    switch (preguntas){
    case 1: 
    textSize(15);
    fill(0);
    text("¿Los juegos olimpicos se originaron en Grecia?", width*0.5, height* 0.58);
    if( key == 'v' || key == 'V'){
 
     } if (key == 'f' || key == 'F'){ 
     text("GAME OVER", width*0.5, height*0.62);
     }
     
     break;
     default:
     break;
     }
    }
    if ( boy > height ) {                        //limintes de la bola o rebotes en la pantalla
      gseq=2;
    }
    if (boy < 0) {                              //limintes de la bola o rebotes en la pantalla
      vy *= sqrt(1 + (sq(aceleracion) - 1)*sq(sin(direccion)));
      vy = -vy;
      sonido_impactoM1.trigger();
    }
    if ( (box < 0 )||(box > width)) {          //limintes de la bola o rebotes en la pantalla
      vx *= sqrt(1 + (sq(aceleracion) - 1)*sq(sin(direccion)));
      vx = -vx;
      sonido_impactoM1.trigger();
    }
    if ( (golpe == 0)&&(bx < box) &&(bx+ban >box)&&(by < boy)&&(by+bal>boy)) {   //funcion para que golpee la barra 
      vy = -vy;
      sonido_impactoBA.trigger();
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
    text("Break Questions", 240, 28);
    fill(0, 0, 255);
    text("Break Questions", 241, 28);
    fill(0, 0, 255); 
    text("Break Questions", 242, 28);
  }
  void gameOver() {//anucio de fin del juego
    barra();
    bloques();
    marcador();
    textSize(50);
    fill(255, 0, 0);
    text("GAME OVER", 300, 400); //aviso que el juego se acabo 
    mcnt++;
    if ((mcnt%60)<40) {
      textSize(20);
      fill(0);
      text("click to retry!", 300, 440);//anucion de reintera el juego
    }
  }
  void mousePressed() {
    if (gseq==3) {
      principal();
    }
  }
}
