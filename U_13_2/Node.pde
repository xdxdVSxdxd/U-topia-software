class Node {

  String s;
  float angle,ampli,v;
  float i;
  float size;
  int rgb;
  
  PVector p;

  public Node() {
    size = random(1, 3);
    rgb = round(random(0, 2));
    p = new PVector();
  }

  boolean isShowingWord = false;
  float tt;

  void update() {

    angle = angle + v;
    
    if (!isShowingWord && random(0, 100)>98) {
      isShowingWord = true;
      tt = 0;
    }
    
    ampli = ampli + 0.04;
    if(ampli>width/2){
      ampli = width/25;
    }
    
  }


  void drawforblur(){
    p = new PVector( ampli*cos(angle), ampli*sin(angle) );
    
    p.add( width/2, height/2);
    
    fill(255,255,0);
    noStroke();
    ellipse(p.x, p.y, size+3, size+3);
    
  }

  void draw() {
    float siz = abs(10*sin(t + PI*i/float(nodes.size())));
    
    p = new PVector( ampli*cos(angle), ampli*sin(angle) );
    
    p.add( width/2, height/2);

    /*
    stroke(255,255,255);
     noFill();
     a.mult(10);
     line(p.x,p.y,p.x+a.x,p.y+a.y);
     a.mult(0);
     */

    int rr = 255;
    int gg = 0;
    int bb = 0;

    if (rgb==1) {
      rr = 0;
      gg = 255;
      bb = 0;
    } else if (rgb==2) {
      rr = 0;
      gg = 0;
      bb = 255;
    }

    fill(rr, gg, bb, 40*(coefflight*ampli/width));
    noStroke();
    ellipse(p.x, p.y, size+3, size+3);

    fill(rr, gg, bb, 100*(coefflight*ampli/width));
    noStroke();
    ellipse(p.x, p.y, size+2, size+2);

    fill(rr, gg, bb, 200*(coefflight*ampli/width));
    noStroke();
    ellipse(p.x, p.y, size+1, size+1);

    fill(255, 255, 255, 255);//*(coefflight*ampli/width));
    noStroke();
    ellipse(p.x, p.y, size-1, size-1);

    if (isShowingWord) {
      float alpha = abs(255*sin(tt));
      fill(255, 255, 255, alpha);
      noStroke();
      textFont(f, 5);
      textAlign(CENTER, CENTER);
      pushMatrix();
      translate(p.x, p.y);
      text(s, 0, siz*2);
      popMatrix();

      tt = tt+0.3;
      if (tt>=PI) {
        isShowingWord = false;
      }
    }
  }
}