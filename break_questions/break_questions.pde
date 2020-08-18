float bx,by,bradio;//Bola
int cont=0;
int i, vx, vy  ;
barra Barra;//Creacion del array barra
bloques[] Bloques = new bloques [6];
void setup(){
  size(600,600);//Tamaño ventana 
  bx =300;//Posicion X de la bola
  by =490;//Posicion Y de la bola
  bradio =22;//Radio de la bola
  vy = -3;
  vx = 3;
  Barra = new barra(250,255,560,93,18);
//for (int i=0; i < Bloques ;i++){
  Bloques[cont] = new bloques(255,0,100,100,30);
  cont++;
 //}
}
void draw(){
  background(0);//Color de fondo 
  fill(255);//Color de la bola
  circle(bx,by,bradio);//Dibujar la bola
  bx += vx;
  by += vy;
  if(bx+bradio/2 > width) vx *= -1;//---]
  if(bx-bradio/2 < 0) vx *= -1;// ------]--limites de la pantalla
  if(by - bradio/2 <0) vy *= -1;//------]
  Barra.display();//Metodo display 
  
//for (int i=0; i < Bloques ;i++){
  Bloques[i].display();
 //}
}
