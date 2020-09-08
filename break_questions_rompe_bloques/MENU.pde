import ddf.minim.*;

PImage img;
Boton botonPlay, botonOpciones, botonSalida;
int escenaMostrar = 1;
Juego myJuego;


void setup() {
  size(600, 600);//Tamaño ventana
  img = loadImage("fondo1.PNG");
  botonPlay = new Boton("JUGAR", width*0.5, 280, 40 );// Inicializar mediante el constructor boton y sus respectivos argumentos
  ellipseMode(RADIUS);
  //botonCreditos = new Boton2("CREDITOS",width*0.5,320,40);
  myJuego = new Juego();
  //colorMode(HSB,255,255,255);
}


void draw() {

  switch(escenaMostrar) {
  case 1:
    //muestro el menu
    image(img, 0, 0,600,600);
    fill(0);
    rect(520,506,46,50);//sistema operativo
    fill(255);
    textSize(22);
    text("PC",542,520);
    textSize(14);
    text("GAME",543,540);
    rect(520,532,44,3);
    fill(66, 66, 66);//clasificacion 
    rect(450,506,58,50);
    fill(0, 194, 54);
    rect(452,508,54,36);
    fill(255);
    textSize(8);
    text("www.pigi.info",480,548);
    textSize(40);
    text("3",480,522);
    
    textSize(16);
    text("Creditos:",110,446);
    text("Creadores del juego:",110,466);
    text("Nolan Bushnell",110,482);
    text("Steve Bristow",110,500);
    text("Creadores de la idea:",110,520);
    text("Jesus A.   Mabel K.",110,538);
    text(" Carrascal  Arias Rincón",110,554);
    
    textSize(50); // Tamaño del texto
    fill(0);
    text("BREAK", width*0.36, height*0.145);// Imprime texto con sus respectivos atributos
    fill(255, 0, 0);
    text("BREAK", width*0.355, height*0.145);
    fill(0);
    text("QUESTIONS", width*0.55, height*0.23);// Imprime texto con sus respectivos atributos
    fill(255, 0, 0);
    text("QUESTIONS", width*0.545, height*0.23);
    botonPlay.dibujar();    // Metodo dibujar boton "Play"
    break;
  case 2:
    myJuego.draw();
    break;
  default:
    //Ninguan de las anteriores
    break;
  }
  
}

boolean botonJugarPresionado() {
  float p = dist(mouseX, mouseY, width*0.5, height*0.6);
  if ( p < 90 ) {
    return true;
  } else {
    return false;
  }
}


void mousePressed() { // Esto ocurre cuando se da clic
  if (escenaMostrar == 1) {  // si estoy en el menu
    if (botonJugarPresionado()) {
      escenaMostrar = 2; //Pasar al juego
    }
  }
//void mouseClicked(){
  //Boton.click();
//}
}
