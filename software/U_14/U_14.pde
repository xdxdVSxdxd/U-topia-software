import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

CameraPath cp;

JSONArray words;
PFont f;

float t;

float tsize = 60;
float multiplier = 5;

ArrayList<Building> buildings;
int n = 500;

float wsize = 1000;

float minbsize = 10;
float maxbsize = 100;

float deltadisplace = 1;

void setup(){
  size(1270,720,P3D);
  JSONObject oo = loadJSONObject("utopia.json");
  words = oo.getJSONArray("children");
  f = createFont("OCRAStdRegular",tsize);
  
  initBoxes();
  
  t = 0;
  
  
  /*
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(5000);
  */
  
  cp = new CameraPath();
  cp.setBoundaries( -wsize, -wsize, wsize, wsize);
  
}

void draw(){
  
  background(0,0,0);
  lights();
  
  t = t + 0.01;
  
  float cameraZ = ((height/2.0) / tan(PI*60.0/360.0));
  perspective(PI/2.0, width/height, cameraZ/10.0, cameraZ*10.0);
    
  cp.getNextCamera();
  
  
  
  for(int i = 0; i<buildings.size(); i++){
    Building b = buildings.get(i);
    b.draw();
  }
  
  
    if(cp.isFinished){
      cp.setBoundaries( -wsize, -wsize, wsize, wsize);
    }
  
  saveFrame("vidframes/i-######.png");
}

void initBoxes(){
  buildings = new ArrayList<Building>();
  
  for(int i = 0; i<n; i++){
    Building b = new Building();
    JSONObject o = words.getJSONObject(i%words.size());
    b.s = new String[1];
    b.s[0] = o.getString("name");
    b.value = o.getFloat("value");
    b.dx = random(minbsize,maxbsize);
    b.dy = random(minbsize,maxbsize);
    b.dz = random(minbsize,maxbsize);
    b.x = random(-wsize,wsize);
    b.y = -b.dy/2;
    b.z = random(-wsize,wsize);
    b.rx = 0;
    b.ry = 0;
    b.rz = 0;
    
    
    buildings.add(b);
  }
  
}