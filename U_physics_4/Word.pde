class Word {

  Body body;
  float w;
  float h;
  float r;
  String s;
  float fontSize;

  Word(float x, float y,String ss) {
    
    s = ss;
    fontSize = random(minfsize,maxfsize);
    
    if(random(0,100)>99){
      fontSize = random(4*maxfsize,8*maxfsize);
    }
    
    textFont(f,fontSize);
    textSize(fontSize);
    
    w = textWidth(s);
    h = fontSize;
    r = 8;
    makeBody(new Vec2(x, y));
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the lollipop
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    
    //disegna
    textFont(f,fontSize);
    textAlign(CENTER,CENTER);
    fill(255,255,255);
    noStroke();
    text(s,0,0);
    
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center) {

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    body.createFixture(sd,1.0);

    // Give it some initial random velocity
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }
}