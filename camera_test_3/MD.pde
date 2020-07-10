import processing.video.*;

class MD{
  int x, y, r;
  boolean move_judge;
  int pix_col, p_col;
  MD(int _x, int _y, int col){
    x = _x;
    y = _y;
    pix_col = col;
  }
  
  MD(int _r){
    r = _r;
  }
  
  void update(int col){
    p_col = pix_col;
    pix_col = col;
  }
  
  void judge(){
    if(abs(pix_col - p_col) <= 1500000){
      move_judge = false;
    }else{
      move_judge = true;
    }
  }
  
  boolean Mjudge(){
    if(abs(pix_col - p_col) <= 1500000){
      return false;
    }else{
      return true;
    }
  }
  
  void display(){
    if(move_judge == true){
      fill(255);
      rect(x,y,r,r);
    }
  }
}
