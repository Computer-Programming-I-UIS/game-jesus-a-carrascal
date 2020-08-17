class barra {
  //Lista de atributos
  float px ,py, ancho, largo;//Posicion en X, posicion en Y, ancho y largo de la barra 
  color c;//Color de la barra
  barra( color c_, float px_, float py_, float ancho_, float largo_){
   c = c_;
   px = px_;
   py = py_;
   ancho = ancho_;
   largo = largo_;
  }
  
  void display(){ //Metodo display 
  rect(px,py,ancho,largo);//Dibujar barra
  }

}
