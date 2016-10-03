import geomerative.*;

RFont f;
RShape[] grp;
ArrayList<RPoint[]> points;

int c;

int maxc;

float steps = 10;

int siz = 200;

PVector[] v;

void setup(){

  size(1450,600);
  
  maxc = 0;
  
  RG.init(this);
  
  grp = new RShape[1];
  grp[0] = RG.getText("UTOPIA", "Impact.ttf", siz, CENTER);
  
  points = new ArrayList<RPoint[]>();
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(5);
  
  for(int i = 0; i<grp.length; i++){
    RPoint[] p1 = grp[i].getPoints();
    points.add(p1);
    println(p1.length);
    maxc = max(maxc,p1.length);
  }
  
  v = new PVector[ 5*maxc ];
  for(int i = 0; i<v.length; i++){
    v[i] = new PVector(random(width) - width/2,random(height) - (height + siz)/2);
  }
  
  c = 0;

  smooth();
  
}

void draw(){

  background(255,255,255);

  translate(width/2, height/2 + siz/2);
  
  fill(0,0,0);
  noStroke();
  
  RG.setPolygonizer(RG.ADAPTATIVE);
  //grp[c].draw();
  
  
  stroke(0,0,0);
  strokeWeight(2);
  noFill();
  
  
  RPoint[] po = points.get(c);
  
  //beginShape();
  /*
  for(int i = 0; i<po.length; i++){
    ellipse(po[i].x, po[i].y,5,5);
    //vertex(po[i].x, po[i].y);
  }
  */
  //endShape(CLOSE);
  
  boolean finished = true;
  boolean todraw = true;
  beginShape();
  for(int i = 0; i<v.length; i++){
    if(i>=po.length){
      //v[i].x = v[i].x + (0 - v[i].x)/steps;
      //v[i].y = v[i].y + (0 - v[i].y)/steps;
      todraw = false;
      if(  abs( v[i].x - 0 )<0.1 &&  abs( v[i].y - 0 )<0.2 ){
        finished = finished && true;
        todraw = false;
      } else {
        finished = finished && false;
        todraw = false;
      }
    }else{
      v[i].x = v[i].x + (po[i].x - v[i].x)/steps ;
      v[i].y = v[i].y + (po[i].y - v[i].y)/steps;
      if(  abs( v[i].x - po[i].x )<0.1 &&  abs( v[i].y - po[i].y )<0.1 ){
        finished = finished && true;
        todraw = true;
      } else {
        finished = finished && false;
        todraw = true;
      }
    }
    if(todraw ){
      vertex(v[i].x,v[i].y);
    }
  }
  endShape(CLOSE);
  
  stroke(0,0,0,80);
  strokeWeight(1);
  for(int i = 0; i<v.length; i++){
    PVector v1 = v[i];
    for(int j = i+1; j<v.length; j++){
      PVector v2 = v[j];
      if(dist(v1.x,v1.y,v2.x,v2.y)<20){
        line(v1.x,v1.y,v2.x,v2.y);
      }
    }
  }
  
  
  if(finished){
    c++;
    if(c>=points.size()){
      c=0;
      noLoop();
    }
  }
  
  //saveFrame("i-######.png");

}


void keyReleased(){

  saveFrame("i-######.png");
  
}