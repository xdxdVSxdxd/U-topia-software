
float minh = 20;
float maxh = 100;


void setup(){
  size(1920,1080);
}


void draw(){
  background(0);
  
  noStroke();
  fill(255,255,255);
  float hh = random(minh,maxh);
  float quota = height/2;
  
  for(float i = 0; i<5; i++){
    
    rect(0,quota-hh/2,width,hh);
    rect(0,height - quota+hh/2,width,hh);
    
    hh = hh * 0.7;
    quota = quota *0.7;
    
  }
  
  
  saveFrame("vidframe/i-######.png");
  
}