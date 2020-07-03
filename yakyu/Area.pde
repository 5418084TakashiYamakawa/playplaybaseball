class Area{
  int x[] = new int[4];
  int y[] = new int[4];
  
  Area(int l_up_x,int l_up_y,int r_up_x,int r_up_y,int r_down_x,int r_down_y,int l_down_x,int l_down_y){
    x[0] = l_up_x;
    y[0] = l_up_y;
    x[1] = r_up_x;
    y[1] = r_up_y;
    x[2] = r_down_x;
    y[2] = r_down_y;
    x[3] = l_down_x;
    y[3] = l_down_y;
  }
  
  boolean judge(int ball_x, int ball_y){
    int cnt = 0;
    for(int i = 0; i < 3; i++){
      if(linecrossed(x[i],y[i],x[(i+1)%4],y[(i+1)%4],ball_x,ball_y,width,ball_y) == true){
        cnt++;
      }
    }
    if(cnt % 2 == 1){
      return true;
    }else{
      return false;
    }
  }
}

boolean linecrossed(int ax,int ay,int bx,int by,int cx,int cy,int dx,int dy) {
  int a = (cx - dx)*(ay - cy)+(cy - dy)*(cx - ax);
  int b = (cx - dx)*(by - cy)+(cy - dy)*(cx - bx);
  int c = (ax - bx)*(cy - ay)+(ay - by)*(ax - cx);
  int d = (ax - bx)*(dy - ay)+(ay - by)*(ax - dx);
  
  if(c*d < 0 && a*b < 0){
    return true;
  }else{
    return false;
  }
}
