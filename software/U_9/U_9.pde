import geomerative.*;

RFont f;
RShape[] grp;
ArrayList<RPoint[]> points;

int c;

int siz = 500;

float maxc;

float t=0;
float coeff = 5;

float dr = 10;

void setup(){
  size(1280,720);
 
  maxc = 0;
  c = 0;
   
  RG.init(this);
  
  grp = new RShape[1];
  grp[0] = RG.getText("u", "Georgia.ttf", siz, CENTER);
  
  points = new ArrayList<RPoint[]>();
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(5);
  
  for(int i = 0; i<grp.length; i++){
    RPoint[] p1 = grp[i].getPoints();
    points.add(p1);
    maxc = max(maxc,p1.length);
  }
  
  
}


void draw(){
  
  t = t + 0.05;
  if(t>2){
    t = 0;
  }
  
  float coeffNow=1;
  
  if(t>=0&&t<1){
    coeffNow = easeInOutExpo(t,1,coeff,1); 
  }
  else if(t>=1&&t<=2){
    coeffNow = max(1, coeff - easeOutExpo(t-1,1,coeff,1) ); 
  }
  
  
  if(random(0,100)>50){
    background(255,255,255);
    stroke(0,0,0);
    fill(0,0,0);
  } else {
    background(0,0,0);
    stroke(255,255,255);
    fill(255,255,255);
  }
  
  

  translate(width/2, height/2 + siz/2);
  
  RPoint[] po = points.get(c);
  
  beginShape();
  for(int i = 0; i<po.length; i++){
    //ellipse(po[i].x, po[i].y,5,5);
    vertex( coeffNow*(po[i].x + random(-dr,dr)), coeffNow*(po[i].y + random(-dr,dr)) );
  }
  endShape(CLOSE);
  
}


// t = current time
// b = start value
// c = change in value
// d = duration
float easeIn (float t, float b, float c, float d) {
  return c * pow( 2, 10 * (t/d - 1) ) + b;
};

float easeOutExpo(float t, float b, float c, float d) {
  return c * ( -pow( 2, -10 * t/d ) + 1 ) + b;
};

float easeInOutExpo(float tt, float b, float c, float d) {
  tt = t/(d/2);
  
  if (tt < 1) return c/2 * pow( 2, 10 * (tt - 1) ) + b;
  tt--;
  return c/2 * ( -pow( 2, -10 * tt) + 2 ) + b;
};