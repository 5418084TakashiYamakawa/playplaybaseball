class Out extends Area{
  Out(int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4){
    super(x1,y1,x2,y2,x3,y3,x4,y4);
  }
  
  void display(){
    stroke(255,0,0);
    quad(x[0],y[0],x[1],y[1],x[2],y[2],x[3],y[3]);
  }
}
