PShape s;


float ddx,ddy;
float c1,c2;

Punto[] points;
int n = 1000;

float spacedim = 100;

float threshold = 50;

void setup() {
  size(1280, 720, P3D);
  s = loadShape("U_.obj");
  
  c1 = 1;
  c2 = 1;
  
  points = new Punto[n];
  for(int i = 0; i<n; i++){
    points[i] = new Punto();
    points[i].x = random(-spacedim,spacedim);
    points[i].y = random(-spacedim,spacedim);
    points[i].z = random(-spacedim,spacedim);
    points[i].c = 0;
    points[i].sx = random(-4,4);
    points[i].sy = random(-4,4);
  }
  
  ddx = width/2;
  ddy = height/2;
}

void draw() {
  background(0);
  
  noStroke();
  fill(255,255,255,100);
  
  translate(ddx, ddy);
  
  float maxC = 0;
  
  for(int k = 0; k<n; k++){
    
    points[k].update();
  
    for(int j = 0; j<s.getChildCount(); j++){
      PShape ss = s.getChild(j);
      beginShape();
      for(int i = 0; i<ss.getVertexCount(); i++){
        PVector v = ss.getVertex(i);
        
        float d = dist(c2*v.x,c2*v.y,c2*v.z,points[k].x,points[k].y,points[k].z);
        
        if(d<threshold){
        
           points[k].c = points[k].c + 1;
        
        }
        vertex(c2*v.x,c2*v.y,c2*v.z);
        
      }
      endShape(CLOSE);
  
      if(maxC<points[k].c){ maxC = points[k].c; }
    }
    //endShape(CLOSE);
  }
  
  
  for(int k = 0; k<n; k++){
    points[k].draw(maxC);
  }
  
  if(mousePressed){
    ddx = ddx + mouseX-pmouseX;
    ddy = ddy + mouseY-pmouseY;
  }
}


void keyReleased(){

  if(key=='a'){
    c1 = c1+1;
  } else if(key=='s'){
    c1 = c1-1;
  } else if(key=='z'){
    c2 = c2+1;
  } else if(key=='x'){
    c2 = c2-1;
  }  

}