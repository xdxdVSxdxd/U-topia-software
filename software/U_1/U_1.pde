import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

import saito.objloader.*;

OBJModel model;

PeasyCam cam;

void setup(){
  size(1280,720,P3D);
  
  model = new OBJModel(this, "U_.obj");
  
  model.enableDebug();
  //model.disableTexture();
  
  noStroke();
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  
}


void draw(){
  
  
  background(255);
  lights();

  fill(255,255,255);
  
  pushMatrix();
  
    translate(width/2, height/2, 0);
    
    model.draw();
  
  popMatrix();
  
  
}