PShape s;
float rotx = 0;

float t = 0;

float c1 = 1;
float c2 = 2;

float rotz = 0;

float ddx,ddy;

float wsize = 300;

CameraPath cp;

void setup() {
  size(1280, 720, P3D);
  s = loadShape("U.obj");
  ddx = 0;//width/2;
  ddy = 0;//height/2;
  
  c1 = 200;
  
  int chi = round(random(0,s.getChildCount()-1));
  PShape ss = s.getChild(chi);
  int ve = round( random(0,ss.getVertexCount()-1) );
  PVector v = ss.getVertex(ve);
  
  
  cp = new CameraPath();
  cp.setBoundaries( c1*v.x-wsize, c1*v.y-wsize, c1*v.x+wsize, c1*v.x+wsize);
  
}

void draw() {
  background(0);
  lights();
  
  
  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
  perspective(PI/2.0, width/height, cameraZ/10.0, cameraZ*10.0);
  
  cp.getNextCamera();
  
  t= t+ 0.005;
  
  noStroke();
  
  fill(255,255,255);

  translate(ddx, ddy);
  
  //println(s.getChildCount());
  
  
  for(int j = 0; j<s.getChildCount(); j++){
    PShape ss = s.getChild(j);
    beginShape();
    for(int i = 0; i<ss.getVertexCount(); i++){
      PVector v = ss.getVertex(i);
      //v.x = v.x + c2*10*(sin(0.7*t + TWO_PI*float(i+j)/100 ));
      //v.y = v.y + c2*10*(cos(0.4*t + TWO_PI*float(i+j)/100 ));
      //v.z = v.z + c2*10*(sin(0.231*t + TWO_PI*float(i+j)/100 ));
      
      v.x = v.x ;
      v.y = v.y ;
      v.z = v.z;
      
      vertex(c1*v.x,c1*v.y,c1*v.z);
    }
    endShape(CLOSE);
  }
  
  //saveFrame("vidscreens/i-######.png");
}