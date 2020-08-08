class Bat{
  PImage bat;
  int x, y;
  float rad = radians(0);
  boolean srt = false, rtn = false;
  Bat(int _x, int _y){
    bat = loadImage("bat.png");
    bat.resize(50,50);
    x = _x;
    y = _y;
  }
  
  void display(){
    pushMatrix();
    translate(x+bat.width,y);
    rotate(rad);
    image(bat,-bat.width,0);
    popMatrix();
  }
  
  void swing(boolean flg){
    if(srt == false && rtn == false) srt = flg;
    if(srt == true){
      rad += radians(-20);
      if(rad <= radians(-260)){
        srt = false;
        rtn = true;
      }
    }
    if(rtn == true){
      rad += radians(20);
      if(rad >= radians(-20)){
        rtn = false;
      }
    }
  }
  
  boolean do_swing(){
    if(srt == false && rtn == false){
      return false;
    }else{
      return true;
    }
  }
}
