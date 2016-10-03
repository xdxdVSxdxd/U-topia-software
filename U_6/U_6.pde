
float minh = 50;
float maxh = 300;


void setup(){
  size(1920,1080);
}


void draw(){
  background(0);
  
  noStroke();
  fill(255,255,255);
  
  float hh = random(minh,maxh);
  println(hh);
  rect(0,height/2-hh/2,width,hh);
  
  saveFrame("vidframes/i-######.png");
  
}