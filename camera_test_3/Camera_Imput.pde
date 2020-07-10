Capture camera;


class Camera_Imput{
  MD[] Pixels;
  Camera_Imput(int _x,int _y, int _r, Capture camera){
    camera.start();
    camera.loadPixels();
    
    Pixels = new MD[_x/_r * _y/_r];
    int i = 0;
    for(int y = r/2; y < _y; y += _r){
      for(int x = r/2; x < _x; x += _r){
        Pixels[i] = new MD(x,y,camera.pixels[y*width + x]);
        i++;
      }
    }
  }
  
  void update(){
    camera.loadPixels();
    image(camera,0,0);
    int i = 0;
    for(int y = r/2; y < height; y += r){
      for(int x = r/2; x < width; x += r){
        Pixels[i].update(camera.pixels[y*width+x]);
        Pixels[i].judge();
        Pixels[i].display();
        i++;
      }
    }
  }
}


void captureEvent(Capture camera) {
  camera.read();
}
