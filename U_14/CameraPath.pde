class CameraPath{

  float sx,sy,ex,ey;
  
  int nsteps = 700;
  float bezierspace = 100;
  
  P[] p;
  int step;
  
  boolean isFinished;
  
  boolean follow;
  
  float getC(){
    
    float s = step/float(nsteps);
    return s;
  
  }
  
  void setBoundaries( float ssx, float ssy, float eex, float eey){
  
    sx = ssx;
    sy = ssy;
    ex = eex;
    ey = eey;
    
    generatePath();
    
    isFinished = false;
  }
  
  void generatePath(){
    
    p = new P[5];
    
    float maxz = 1000;
    
    if(random(0,100)>10){
    
      follow = true;
      maxz = 300;
    
    } else {
    
      follow = false;
      
    }
    
    if(random(0,10)>5){
    
      p[0] = new P();
      p[0].x = sx;
      p[0].y = random(sy,ey);
      p[0].z = random(200,maxz);
      
      
      p[1] = new P();
      p[1].x = sx - bezierspace;
      p[1].y = random(sy,ey);
      p[1].z = random(200,maxz);
      
      
      p[2] = new P();
      p[2].x = ex + bezierspace;
      p[2].y = random(sy,ey);
      p[2].z = random(200,maxz);
      
      
      p[3] = new P();
      p[3].x = ex;
      p[3].y = random(sy,ey);
      p[3].z = random(200,maxz);
      
    } else {
    
      p[0] = new P();
      p[0].x = random(sx,ex);
      p[0].y = sy;
      p[0].z = random(200,maxz);
      
      
      p[1] = new P();
      p[1].x = random(sx,ex);
      p[1].y = sy + bezierspace;
      p[1].z = random(200,maxz);
      
      
      p[2] = new P();
      p[2].x = random(sx,ex);
      p[2].y = ey - bezierspace ;
      p[2].z = random(200,maxz);
      
      
      p[3] = new P();
      p[3].x = random(sx,ex);
      p[3].y = ey;
      p[3].z = random(200,maxz);
    
    }
    
    
    // target dove guarda la telecamera
    p[4] = new P();
    p[4].x = random(sx,ex);
    p[4].y = random(sy,ey);
    p[4].z = random(0,300);
    
    step = 0;
    
  
  }
  
  void getNextCamera(){
    
    float s = step/float(nsteps);
    float s1 = min(step+1,nsteps)/float(nsteps);
    
    float x = bezierPoint(p[0].x,p[1].x,p[2].x,p[3].x,s);
    float y = bezierPoint(p[0].y,p[1].y,p[2].y,p[3].y,s);
    float z = bezierPoint(p[0].z,p[1].z,p[2].z,p[3].z,s);
    
    
    float x1 = bezierPoint(p[0].x,p[1].x,p[2].x,p[3].x,s1);
    float y1 = bezierPoint(p[0].y,p[1].y,p[2].y,p[3].y,s1);
    float z1 = bezierPoint(p[0].z,p[1].z,p[2].z,p[3].z,s1);
    
    if(follow){
      camera(x, y, z, x1, y1, z1, 0, 1, 0);
    }
    else {
      camera(x, y, z, p[4].x, p[4].y, p[4].z, 0, 1, 0);
    }
    
    
    step++;
    
    if(step==nsteps){
      isFinished = true;
    }
  
  }

}