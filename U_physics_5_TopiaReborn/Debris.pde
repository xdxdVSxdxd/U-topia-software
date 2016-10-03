class Debris {

  Body body;
  float w;
  float h;
  float r;
  
  PolygonShape sd;
  
  Debris(float x, float y,float rr) {
    
    
    w = rr;
    h = rr;
    r = rr;
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

    noFill();
    stroke(0,255,0);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    
    //disegna
    beginShape();
    for(int i = 0; i<6; i++){
      Vec2 vv = sd.getVertex( i );
      vertex(r*vv.x,r*vv.y);
      
    }
    endShape(CLOSE);
    
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center) {

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    sd = new PolygonShape();
    
    Vec2 vertices[] = new Vec2[6];
    
    for(float i = 0; i<6; i= i+1){
      float ang = TWO_PI*i/6;
      vertices[int(i)] = new Vec2(  cos(ang) , sin(ang)  );
    }
    
    sd.set(vertices,6);
    sd.setRadius(r);
    
    body.createFixture(sd,0.1);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}