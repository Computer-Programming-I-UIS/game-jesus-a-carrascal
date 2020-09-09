import ddf.minim.*;
Minim gestor;
AudioSample sonido_impactoB;
AudioSample sonido_impactoBA;
AudioSample sonido_impactoM1;


PImage img;
Boton botonPlay, botonCreditos, botonSalida;
int escenaMostrar = 1;
Juego myJuego;



void setup() {
  size(600, 600);//Tamaño ventana
  img = loadImage("fondo1.PNG");
  botonPlay = new Boton("JUGAR", width*0.5, height*0.42, 50 );// Inicializar mediante el constructor boton y sus respectivos argumentos
  botonCreditos = new Boton("CREDITOS", width*0.5, height*0.6, 50 );
  botonSalida = new Boton("SALIDA", width*0.5, height*0.78, 50 );
  ellipseMode(RADIUS);
  myJuego = new Juego();
  gestor = new Minim(this);
  sonido_impactoB = gestor.loadSample("golpeB1.mp3");
  sonido_impactoB.setGain(-10);
  sonido_impactoBA = gestor.loadSample("golpeM.mp3");
  sonido_impactoBA.setGain(-10);
  sonido_impactoM1 = gestor.loadSample("golpeM1.mp3");
  sonido_impactoM1.setGain(-10);
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

    botonPlay.dibujar();    // Metodo dibujar boton "Play"
    botonCreditos.dibujar(); // Metodo dibujar boton "Creditos"
    botonSalida.dibujar();  // Metodo dibujar boton "Salida"
    break;
  case 2:
    myJuego.draw();
    break;
  case 3:
    image(img, 0, 0, 600, 600);
    textSize(70); // Tamaño del texto
    text("CREDITOS", width*0.505, height*0.19);// Imprime texto con sus respectivos atributos
    fill(255, 0, 0);
    text("CREDITOS", width*0.5, height*0.19);
    fill(0);
    textSize(15);
    text("CREADORES DEL JUEGO:", width/2, height*0.35);
    text("Nolan Bushnell", width/2, height*0.38);
    text("Steve Bristow", width/2, height*0.41);
    text("CREADORES DE LA IDEA:", width/2, height*0.45);
    text("Mabel Arias", width/2, height*0.48);
    text("Jesus Carrascal", width/2, height*0.51);
    text("COLABORADOR DE PROGRAMACION:", width/2, height*0.55);
    text("Alex Mantilla", width/2, height*0.58);
    text("SONIDOS:",width/2, height*0.61);
    text("www.sonidosmp3gratis.com",width/2, height*0.64);
    text("Presione 's' si desea volver al menú", width/2, height*0.8);
    if( key == 's' ){
      
    }
    break;
  case 4:
  
    break;
  default:
    //Ninguna de las anteriores
    break;
  }
}

boolean botonJugarPresionado() {
  float p = dist(mouseX, mouseY, width*0.5, height*0.42);
  if ( p < 50 ) {
    return true;
  } else {
    return false;
  }
}
boolean botonCreditosPresionado() {
  float p = dist(mouseX, mouseY, width*0.5, height*0.6);
  if ( p < 50 ) {
    return true;
  } else {
    return false;
  }
}
boolean botonSalidaPresionado() {
  float p = dist(mouseX, mouseY, width*0.5, height*0.78);
  if ( p < 50 ) {
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
    
    if (botonCreditosPresionado()) {
      escenaMostrar = 3; //Pasar a creditos
    }

    if (botonSalidaPresionado()) {
      escenaMostrar = 4; //Pasar a salida
    }   
  }       
    
  }
