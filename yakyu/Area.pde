class Area{
  float x[] = new float[4];
  float y[] = new float[4];
  
  Area(float l_up_x,float l_up_y,float r_up_x,float r_up_y,float r_down_x,float r_down_y,float l_down_x,float l_down_y){
    x[0] = l_up_x;
    y[0] = l_up_y;
    x[1] = r_up_x;
    y[1] = r_up_y;
    x[2] = r_down_x;
    y[2] = r_down_y;
    x[3] = l_down_x;
    y[3] = l_down_y;
  }
  
  boolean judge(float ball_x, float ball_y){
    int c = 0;
    float ax, bx, ay, by;
    for(int i = 0; i < 4; i++){
      if(x[i] < x[(i+1)%4]){
        ax = x[i]-1;
        bx = x[(i+1)%4]+1;
      }else{
        ax = x[i]+1;
        bx = x[(i+1)%4]-1;
      }
      if(y[i] < y[(i+1)%4]){
        ay = y[i]-1;
        by = y[(i+1)%4]+1;
      }else{
        ay = y[i]+1;
        by = y[(i+1)%4]-1;
      }
      if(linecrossed(ax,ay,bx,by,ball_x,ball_y,width,ball_y) == true){
        c++;
      }
    }
    if(c == 1){
      return true;
    }else{
      return false;
    }
  }
}

boolean linecrossed(float ax,float ay,float bx,float by,float cx,float cy,float dx,float dy) {
  float a = (cx - dx)*(ay - cy)+(cy - dy)*(cx - ax);
  float b = (cx - dx)*(by - cy)+(cy - dy)*(cx - bx);
  float c = (ax - bx)*(cy - ay)+(ay - by)*(ax - cx);
  float d = (ax - bx)*(dy - ay)+(ay - by)*(ax - dx);
  
  if(c*d < 0 && a*b < 0){
    return true;
  }else{
    return false;
  }
}
