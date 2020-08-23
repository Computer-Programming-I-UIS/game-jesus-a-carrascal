class bloques{
  int ancho=100,alto=22;
  
  
  bloques(){
  //qx=0;
  //qy=40;
  //ancho=100;
  //alto=20;
  }
  void acutualizar(){
    
  
  }
  void draw(){
  for(int j=1;j<8;j++){
    for(int i=0;i<6;i++){
    
    if(is_alive[i][j]){
      fill(0,255,0);
      rect(i*ancho,j*alto,ancho,alto);
    }
        if((bolax + bolar/2 >i*ancho && bolax - bolar/2 < (i+1)*ancho) 
        &&(j*alto < bolay - bolar/2 && bolay - bolar/2 < (j+1)*alto)
        && is_alive[i][j]){ 
          vy *= -1;
          bolay = bolar/2 + (j+1)*alto+1;
          is_alive[i][j] = false; 
      }
  }
 }
}
}
