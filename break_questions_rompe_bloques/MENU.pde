PImage img;
Boton botonPlay, botonOpciones, botonSalida;
int escenaMostrar = 1;
Juego myJuego;

void setup() {
  size(600, 600);//Tamaño ventana
  img = loadImage("fondo1.PNG");
  botonPlay = new Boton("JUGAR", width*0.5, height*0.6, 90 );// Inicializar mediante el constructor boton y sus respectivos argumentos
  ellipseMode(RADIUS);
  myJuego = new Juego();
}


void draw() {

  switch(escenaMostrar) {
  case 1:
    //muestro el menu
    image(img, 0, 0, 600, 600);
    textSize(50); // Tamaño del texto
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
}
