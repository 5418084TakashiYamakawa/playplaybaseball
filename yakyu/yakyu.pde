int r = 10;
Camera_Imput imput;
State state;
Bat bat;

void setup() {
  size(800, 800);
  textSize(32);
  textAlign(CENTER);
  fill(255);
  state = new TitleState();
  b=new Ball(width/2,height/2,10);
  catcher=new Out(width/2-50,height-30,width/2+50,height-30,width/2+50,height+50,width/2-50,height+50);
  int n=70;
  first=new Out(495,445,575,515,555,540,width/2+n,height/2+n);
  second=new Out(225,515,305,445,width/2-n,height/2+n,245,540);
  center=new Out(width/2-40,250, width/2+40, 250, width/2+35, 290, width/2-35, 290);
  hit=new Hitbox(width/2-50,height-100,width/2+50,height-100,width/2+50,height-30,width/2-50,height-30);
  bat = new Bat(320, 730);
  
  String[] cameras = Capture.list();
  camera = new Capture(this, cameras[0]);
  imput = new Camera_Imput(640,480,r,camera);
}

void draw() {
  background(0);
  state = state.doState();
  imput.update();
  if(imput.judge() && !bat_move){
    bat_move = true;
    b.jude();
  }
}

abstract class State {
  int x=0;
  State() {
   
  }

  State doState() {
   
    drawState();
    return decideState();
  }

  abstract void drawState();    // 
  abstract State decideState(); // 
}
class TitleState extends State {
  void drawState() {
    text("play baseball", width * 0.5, height * 0.3);
    text("Press 'z' key to start", width * 0.5, height * 0.7);
  }

  State decideState() {
    if (keyPressed && key == 'z') { // if 'z' key is pressed
      return new GameState(); // start game
    }
    return this;
  }
}

class GameState extends State {
  void drawState() {
    background(0);
    prtstage();
    if(cnt<5){
      b.display();
      b.move();
      b.ballstart();

    }
    
  }

  State decideState() {
    if (cnt >= 5) { // if ellapsed time is larger than
      return new EndingState(); // go to ending
    } 
    return this;
  }
}

class EndingState extends State {
  void drawState() {
    text(point, width * 0.5, height * 0.5);
    text("point",width * 0.5, height * 0.5+50);     
    text("Press 'a' to restart.", width * 0.5, height * 0.7);
    
  }

  State decideState() {
    if (keyPressed && key == 'a') {
      cnt=0;
      point=0;
      return new GameState();
    }
    return this;
  }
}
