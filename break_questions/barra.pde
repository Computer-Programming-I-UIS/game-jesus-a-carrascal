class barra {
  //Lista de atributos
  float px ,py, ancho, largo,pxx ;//Posicion en X, posicion en Y, ancho y largo de la barra 
  color c;//Color de la barra
  barra( color c_, float px_, float py_, float ancho_, float largo_){
   c = c_;
   px = px_;
   py = py_;
   ancho = ancho_;
   largo = largo_;
  }
  
  void display(){ //Metodo display 
  rect(mouseX,py,ancho,largo);//Dibujar barra
  if((bx + bradio/2 > mouseX && bx - bradio/2 < mouseX+ancho)&&
    (560 < by + bradio/2 && by + bradio/2 < 560+largo))// al cambiar la ubicacionde de la barra 
    {                                                  //se tiene que cambia donde esta ###  
    vy *= -1;                                          //(### < by + bradio/2 && by + bradio/2 < ###+largo) para que pegue (rebote) la bola 
    }*/
  }

}
