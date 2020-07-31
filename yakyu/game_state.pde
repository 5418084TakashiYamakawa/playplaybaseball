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
class Ball{
  float x,y,d,ay=int(random(3,6));
  float ax=0;
  boolean batting=false,out;
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
       batting=true;
       ax+=cos(hit.angle(y));
     }    
     batting = hit.hit(y);
     if(batting){
       ay *= -1;
       ax = ay*cos(hit.angle(y));
       ay = ay*sin(hit.angle(y));
     }
   }
   void judgeout(){
     out=true;
   }
   void ballstart(){
     if((y<0 || y>width) || (x<0 || x>width))
       point+=100;
    if((y<0 || y>width) || (x<0 || x>width)){
       ay=int(random(3,6));
       ax=0;
       batting = false;
       x=width/2;
       y=height/2;
       cnt++;
     }
   }
}
void mouseClicked(){
  println(mouseX,mouseY);
  if(!b.batting){
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
