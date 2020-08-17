float bx,by,bradio;//Bola
int cont=0;
barra Barra;//Creacion del array barra
bloques[] Bloques = new bloques [6];
void setup(){
  size(600,600);//Tamaño ventana 
  bx =300;//Posicion X de la bola
  by =490;//Posicion Y de la bola
  bradio =22;//Radio de la bola
  
  Barra = new barra(250,255,502,93,18);
//for (int i=0; i < Bloques ;i++){
  Bloques[cont] = new bloques(255,0,100,100,30);
  cont++;
 //}
}
void draw(){
  background(0);//Color de fondo 
  fill(255);//Color de la bola
  circle(bx,by,bradio);//Dibujar la bola
  Barra.display();//Metodo display 
  
//for (int i=0; i < Bloques ;i++){
  Bloques[i].display();
 //}
}
