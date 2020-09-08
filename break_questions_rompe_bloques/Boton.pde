class Boton{
  
 String nomboton,nomboton1; // Metodo examinar cadena de caracteres
 float x1,x2;// Posicion en x
 float y1,y2;// Posicion en y
 float radio;// Radio del boton
 boolean creditos;

  Boton(String nomboton_, float x1_, float y1_, float radio_){
   nomboton = nomboton_;
   x1 = x1_;
   y1 = y1_;
   radio = radio_;
   }
  void click(){
    if (mouseX > 527 && mouseX < 759 && mouseY > 376 && mouseY < 450){
      creditos = true;
   } else if (mouseX > 553 && mouseX < 732 && mouseY > 460 && mouseY < 528){
      exit();
   }
  } 
   void dibujar(){
   fill(255,0,0); // Color de los botones
   stroke(0);  // Color de borde de los botones
   ellipse(x1,y1,radio,radio); //
   textSize(17); // Tamaño del texto
   textAlign(CENTER, CENTER); // Alineacion del texto de los botones 
   fill(0);  // Color del texto
   text(nomboton, x1, y1);  // Texto de los botones y sus coordenadas
    
   
 }
 
 //creditos 
 
}
