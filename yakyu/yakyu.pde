State state;

void setup() {
  size(800, 800);
  textSize(32);
  textAlign(CENTER);
  fill(255);
  state = new TitleState();
  b=new Ball(width/2,height/2,10);
}

void draw() {
  background(0);
  state = state.doState();
}

abstract class State {
  long t_start;
  float t;
  int x=0;
  State() {
    t_start = millis();
  }

  State doState() {
    t = (millis() - t_start) / 1000.0;    
    text(nf(t, 1, 3)  + "sec.", width * 0.5, height * 0.9);
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
    text("Game (for 5 seconds)", width * 0.5, height * 0.5);
    if(cnt>5){
      b.display();
      b.move();
      b.ballstart();
      println(x);
    }
    
  }

  State decideState() {
    if (x > 5) { // if ellapsed time is larger than
      return new EndingState(); // go to ending
    } 
    return this;
  }
}

class EndingState extends State {
  void drawState() {
    text("Ending", width * 0.5, height * 0.5);
    if (t > 3) {
      text("Press 'a' to restart.", width * 0.5, height * 0.7);
    }
  }

  State decideState() {
    if (t > 3 && keyPressed && key == 'a') {
      return new GameState();
    }
    return this;
  }
}
