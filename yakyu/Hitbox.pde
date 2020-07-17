class Hitbox extends Area{
  Hitbox(int x1,int y1,int x2,int y2,int x3,int y3,int x4,int y4){
    super(x1,y1,x2,y2,x3,y3,x4,y4);
  }
  
  float angle(float ball_y){
    float hit_area = (y[3] - y[0]) * 1.0;
    float hit_ball = (ball_y - y[0]) * 1.0;
    float angle = PI/4 + (PI/2 * (hit_ball/hit_area));
    return angle;
  }
  
  void display(){
    quad(x[0],y[0],x[1],y[1],x[2],y[2],x[3],y[3]);
  }
}
