Ball b;
int cnt=30;

class Ball{
  int x,y,d,ay=int(random(1,6));
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
     if(batting){
       ay*=-1;
       batting=false;
     }
     y+=ay;  
     println("ay="+ay);
   }
   void jude(){
     if(height-100<=y && height-50>=y ){
       
       x+=50;
       batting=true;
     }    
   }
   void ballstart(){
     if(y<0 || y>width){
       if(y>width){
         println(1);
       }
       x=width/2;
       y=height/2;
       ay=int(random(1,6));
       cnt++;
     }
   }
}
void mouseClicked(){
  b.jude();
}
void prtstage(){
  fill(204,255,51);
  drawDiamond(width/2, height/2, width/2);
  line(width/2-50,height-100,15,height/2);
  line(width/2+50,height-100,width-15,height/2);
  bezier(100,height/2-50,width/2-100,height/4-50,width/2+100,height/4-50,width-100,height/2-50);
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
