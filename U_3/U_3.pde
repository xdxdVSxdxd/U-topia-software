PShape s;


float ddx,ddy;
float c1,c2;

void setup() {
  size(1280, 720, P3D);
  s = loadShape("U_.obj");
  s.disableStyle();
  
  c1 = 1;
  c2 = 1;
  
  ddx = width/2;
  ddy = height/2;
}

void draw() {
  background(0);
  lights();
  
  noStroke();
  fill(255,255,255);
  
  translate(ddx, ddy);
  
  for(int j = 0; j<s.getChildCount(); j++){
    PShape ss = s.getChild(j);
    beginShape();
    for(int i = 0; i<ss.getVertexCount(); i++){
      PVector v = ss.getVertex(i);
      v.x = v.x;
      v.y = v.y + c1*sin(v.y*millis()/height);
      v.z = v.z;
      
      vertex(c2*v.x,c2*v.y,c2*v.z);
      
    }
    endShape(CLOSE);
  }
  
  shape(s,0,0);
  
  
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