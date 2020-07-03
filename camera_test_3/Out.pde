class Out{
  int x,y;
  Out(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  boolean jugde(int ball_x, int ball_y){
    if(dist(x,y,ball_x,ball_y) <= 10){
      return true;
    }
    return false;
  }
  
  void diaplay(){
    noFill();
    ellipse(x,y,10,10);
  }
}
