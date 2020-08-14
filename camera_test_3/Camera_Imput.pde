

class Camera_Imput{
  MD[] Pixels;
  int r;
  Camera_Imput(int _x,int _y, int _r, Capture camera){
    camera.start();
    camera.loadPixels();
    r = _r;

    Pixels = new MD[_x/r * _y/r];
    int i = 0;
    for(int y = r/2; y < _y; y += r){
      for(int x = r/2; x < _x; x += r){
        Pixels[i] = new MD(x,y,camera.pixels[y*width + x]);
        i++;
      }
    }
  }
  
  void update(){
    camera.loadPixels();
    int i = 0;
    for(int y = r/2; y < height; y += r){
      for(int x = r/2; x < width; x += r){
        Pixels[i].update(camera.pixels[y*width+x]);
        i++;
      }
    }
  }
  
  boolean judge(){
    int cnt = 0;
    for(int i = 0; i < Pixels.length; i++){
      if(Pixels[i].Mjudge()){
        cnt++;
      }
    }
    if(cnt >= 500){
      return true;
    }else{
      return false; 
    }
  }
}


void captureEvent(Capture camera) {
  camera.read();
}
