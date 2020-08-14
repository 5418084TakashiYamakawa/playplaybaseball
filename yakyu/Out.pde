class Out extends Area{
  Out(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4){
    super(x1,y1,x2,y2,x3,y3,x4,y4);
  }
  
  void display(){
    stroke(255,0,0);
    quad(x[0],y[0],x[1],y[1],x[2],y[2],x[3],y[3]);
  }
}
