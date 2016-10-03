
PFont f;

float fsize = 100;

float t = 0;

void setup(){

  size( 1280,720 );

  f = createFont("OCRAStdRegular",fsize);
}

void draw(){
  
  t = t + 0.1;
  
  if(t>=4*TWO_PI){
    noLoop();
  }

  background(random(40,255),random(40,255),random(40,255));
  
  float subdivs = round( 1*abs(sin(t)) );
  float subdivs2 = round( 1*abs(sin(3*t)) );
  
  float ddx = (width/2)/subdivs;
  
  float ddy = (height/2)/subdivs2;
  
  
  fill(random(40,255),random(40,255),random(40,255));
  noStroke();
  
  for(float j = 0; j<subdivs2; j=j+1){
    for(float k = 0; k<subdivs; k=k+1){
      pushMatrix();
      translate((k)*ddx + (k+1)*ddx,(j)*ddy + (j+1)*ddy);
      rotate(-2*t);
      textAlign(CENTER,CENTER);
      textFont( f , abs(4*fsize*sin(t)/(subdivs+subdivs2))  );
      text("TOPIA",0,0);
      popMatrix();
    }
  }
  
  saveFrame("vidframes/i-######.png");

}