class Punto{

  float x,y,z,c;
  float sx,sy,sz;


  void update(){
    x = x + sx;
    y = y + sy;
    z = z + sz;
    
    c = 0;
    
    if(x<-spacedim){ x = spacedim; }
    else if(x>spacedim){ x = 0; }
    
    if(y<-spacedim){ y = spacedim; }
    else if(y>spacedim){ y = 0; }
    
    if(z<-spacedim){ z = spacedim; }
    else if(z>spacedim){ z = 0; }
  }

  void draw(float maxValue){
    
    noStroke();
    fill(255,255,255, 255*c/maxValue);
    pushMatrix();
    translate(x,y,z);
    box(2,2,2);
    popMatrix();
  
  }

}