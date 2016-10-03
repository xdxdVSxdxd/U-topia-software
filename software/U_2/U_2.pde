PShape s;
float rotx = 0;

float t = 0;

float c1 = 1;
float c2 = 2;

float rotz = 0;

float ddx,ddy;

void setup() {
  size(1280, 720, P3D);
  s = loadShape("U.obj");
  ddx = width/2;
  ddy = height/2;
}

void draw() {
  background(0);
  lights();
  
  t= t+ 0.005;
  
  noStroke();
  
  fill(255,255,255);

/*
ddx,ddy
353.0,792.0
-432.0,820.0
*/
  ddx = (-432.0 + 353.0)/2;
  ddy = (820.0 + 792)/2;
  
  translate(ddx, ddy);
  
  rotz = 0;
  rotx = PI/2;
  
  
  rotateZ(rotz);
  rotateX(rotx);
  rotateY(t);
  //shape(s, 0, 0,400,400);
  
  c2=0.12000179;
  
  /*
  if(random(0,100)>90){
  
    float q = random(0,100);
    
    
    
    if(q<93){
      c2=0;
    } else if(q<94){
      c2=1.7732382E-6;
    } else if(q<95){
      c2=.025001772;
    } else if(q<96){
      c2=0.055001765;
    } else if(q<97){
      c2=0.085001774;
    } else if(q<98){
      c2=0.12000179;
    } else if(q<99){
      c2=0.15500176;
    }
  
  }
  
  */
  
  c1 = 200;
  
  //println(s.getChildCount());
  
  
  for(int j = 0; j<s.getChildCount(); j++){
    PShape ss = s.getChild(j);
    beginShape();
    for(int i = 0; i<ss.getVertexCount(); i++){
      PVector v = ss.getVertex(i);
      //v.x = v.x + c2*10*(sin(0.7*t + TWO_PI*float(i+j)/100 ));
      //v.y = v.y + c2*10*(cos(0.4*t + TWO_PI*float(i+j)/100 ));
      //v.z = v.z + c2*10*(sin(0.231*t + TWO_PI*float(i+j)/100 ));
      
      v.x = v.x + random(-c2,c2);
      v.y = v.y + random(-c2,c2);
      v.z = v.z + random(-c2,c2);
      
      vertex(c1*v.x,c1*v.y,c1*v.z);
    }
    endShape(CLOSE);
  }
  
  //rotx = rotx + 0.001;
  
  if(mousePressed){
    ddx = ddx + mouseX-pmouseX;
    ddy = ddy + mouseY-pmouseY;
    
    println(ddx + "," + ddy);
  }
  
  
  if(keyPressed){
    if(key=='a'){
      c1 = c1+1;
      println("c1=" + c1);
    } else if(key=='s'){
      c1 = c1-1;
      println("c1=" + c1);
    } else if(key=='z'){
      c2 = c2+0.005;
      println("c2=" + c2);
    } else if(key=='x'){
      c2 = c2-0.005;
      println("c2=" + c2);;
    } else if(key=='p'){
      rotz = rotz + 0.4;
      println("rotz=" + rotz);
    } else if(key=='o'){
      rotz = rotz - 0.4;
      println("rotz=" + rotz);
    }
  
  }
  
  //saveFrame("vidscreens/i-######.png");
}


/*
void keyReleased(){

  if(key=='a'){
    c1 = c1+1;
  } else if(key=='s'){
    c1 = c1-1;
  } else if(key=='z'){
    c2 = c2+0.001;
  } else if(key=='x'){
    c2 = c2-0.001;
  } else if(key=='p'){
    rotz = rotz + 0.4;
  } else if(key=='o'){
    rotz = rotz - 0.4;
  }  

}
*/