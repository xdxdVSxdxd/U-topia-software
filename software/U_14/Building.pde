class Building{

  float tt,ttinc;
  String[] s;
  float x,y,z;
  float rx,ry,rz;
  float dx,dy,dz;
  float value;
  
  public Building(){
    tt = 0;
    ttinc = random(0.01,0.08);
  }
  
  void draw(){
    tt = tt + ttinc;
    pushMatrix();
    translate(x,y,z);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    fill(255,255,255);
    noStroke();
    //box(dx,dy,dz);
    
    fill(255,0,0,50+abs(205*sin(tt)));
    textAlign(CENTER,CENTER);
    
    pushMatrix();
    translate(0,0,dz/2+deltadisplace);
    textFont(f,  2*dx/(s[0].length())  );
    for(float ii = -dx; ii<=dx; ii = ii + 2*dx/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    pushMatrix();
    translate(0,0,-dz/2-deltadisplace);
    rotateY(PI);
    textFont(f,  2*dx/(s[0].length())  );
    for(float ii = -dx; ii<=dx; ii = ii + 2*dx/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    
    pushMatrix();
    translate(0,dy/2+deltadisplace,0);
    rotateX(PI/2);
    textFont(f,  2*dy/(s[0].length())  );
    for(float ii = -dy; ii<=dy; ii = ii + 2*dy/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    pushMatrix();
    translate(0,-dy/2-deltadisplace,0);
    rotateX(PI/2);
    textFont(f,  2*dy/(s[0].length())  );
    for(float ii = -dy; ii<=dy; ii = ii + 2*dy/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    
    pushMatrix();
    translate(dx/2+deltadisplace,0,0);
    rotateY(PI/2);
    textFont(f,  2*dz/(s[0].length())  );
    for(float ii = -dz; ii<=dz; ii = ii + 2*dz/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    pushMatrix();
    translate(-dx/2-deltadisplace,0,0);
    rotateY(PI/2);
    textFont(f,  2*dz/(s[0].length())  );
    for(float ii = -dz; ii<=dz; ii = ii + 2*dz/(s[0].length())){
      text(s[0],0,ii);
    }
    popMatrix();
    
    popMatrix();
  }

}