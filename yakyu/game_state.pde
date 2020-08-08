Ball b;
int cnt=0;
int point=0;
Out catcher;
Out first;
Out second;
Out third;
Out shor;
Out center;
Out left;
Out right;
Hitbox hit;
boolean bat_move = false;
class Ball {
  float x,y,d,ay=int(random(3,6));
  float ax=0;
  boolean out;
   Ball(int _x,int _y,int _d){
     x=_x;
     y=_y;
     d=_d;
   }
   void display(){
     fill(255);
     if(!out){
        ellipse(x,y,d,d); 
     }
   }
   void move(){     
     y+=ay; 
     x+=ax;

   }
   void jude(){
     if(height-100<=y && height-50>=y ){       
       ax+=cos(hit.angle(y));
     }    
     if(hit.hit(y)){
       ay *= -1;
       ax = ay*cos(hit.angle(y));
       ay = ay*sin(hit.angle(y));
     }
   }
   void judgeout(){
     out=true;
   }
   void ballstart(){
     if(ballOut(x,y) >= 1){
       if(ballOut(x,y) == 2){
         point += 100;
       }
       ay=int(random(3,6));
       ax=0;
       x=width/2;
       y=height/2;
       cnt++;
     }
   }
}
void mouseClicked(){
  if(!bat_move){
    bat_move = true;
    b.jude();
  }
}
void prtstage(){
  fill(204,255,51);
  drawDiamond(width/2, height/2, width/2);
  line(width/2-50,height-100,15,height/2);
  line(width/2+50,height-100,width-15,height/2);
  bezier(100,height/2-50,width/2-100,height/4-50,width/2+100,height/4-50,width-100,height/2-50);
  hit.display();
  catcher.display();
  first.display();
  second.display();
  if(bat_move && bat.do_swing() == false){
    bat.swing(true);
  }else if(bat.do_swing() == true){
    bat.swing(false);
  }
  bat.display();
  if(bat.do_swing() == false){
    bat_move = false;
  }
}
void drawDiamond(int x, int y, int r) {
  int R;
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < 4; i++) {
    if (i % 2 == 0) {
      R = r;
    } else {
      R = r*6/7;
    }
    vertex(R*cos(radians(90*i)), R*sin(radians(90*i)));
  }
  endShape(CLOSE);
  popMatrix();
}

int ballOut(float ballx, float bally){
  if((bally<0 || bally>width) || (ballx<0 || ballx>width)){
    return 2;
  }
  if(first.judge(ballx, bally) || second.judge(ballx, bally) || catcher.judge(ballx, bally)){
    return 1;
  }
  return 0;
}
