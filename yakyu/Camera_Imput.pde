

class Camera_Imput{
  MD[] Pixels;
  int r, w, h;
  Camera_Imput(int _x,int _y, int _r, Capture camera){
    camera.start();
    camera.loadPixels();
    r = _r;
    w = _x;
    h = _y;
    
    Pixels = new MD[_x/_r * _y/_r];
    int i = 0;
    for(int y = _r/2; y < _y; y += _r){
      for(int x = _r/2; x < _x; x += _r){
        Pixels[i] = new MD(x,y,camera.pixels[y*w + x]);
        i++;
      }
    }
  }
  
  void update(){
    camera.loadPixels();
    int i = 0;
    for(int y = r/2; y < h; y += r){
      for(int x = r/2; x < w; x += r){
        Pixels[i].update(camera.pixels[y*w+x]);
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
