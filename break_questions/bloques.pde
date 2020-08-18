class bloques{
  //Lista de atributos 
  color c1;
  float x,y,a,l;//Posicion en X, posicion en Y, ancho y largo de los bloques
  
  bloques(color c1_, float x_, float y_, float a_, float l_){
   c1 = c1_;
   x = x_;
   y = y_;
   a = a_;
   l = l_;
  }
  
  void display(){
    rect(x,y,a,l);//Dibujar bloques
    
  }
  
}
