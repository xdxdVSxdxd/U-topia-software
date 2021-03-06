import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


PFont f;

Box2DProcessing box2d;

JSONArray w;

int n = 900;

float minfsize = 4;
float maxfsize = 15;


ArrayList<Word> words;
ArrayList<Boundary> boundaries;

float t;

void setup(){

  size(1920,1080);
  
  t = 0;
  
  f = createFont("Helvetica" , 60);
  
  w = loadJSONArray("words.json");
  
  box2d = new Box2DProcessing(this,20);
  box2d.createWorld();
  box2d.setGravity(0, -4);

  words = new ArrayList<Word>();
  boundaries = new ArrayList<Boundary>();
  
  boundaries.add(new Boundary(width/2,-5,width,10,0));
  boundaries.add(new Boundary(width/2,height+5,width,10,0));
  boundaries.add(new Boundary(-5,height/2,10,height,0));
  boundaries.add(new Boundary(width+5,height/2,10,height,0));
  
  
  for(int i = 0; i<n; i++){
    
    
    
    Word ww = new Word(random(0,width),random(0,height) , w.getString(i%w.size()) );
    words.add(ww);
  }
  
  
}


void draw(){
  background(0,0,0);
  
  t = t + 0.03;
  
  //box2d.setGravity(40*cos(t), 40*sin(t));
  
  box2d.step();
  
  for (Boundary wall: boundaries) {
    wall.display();
  }
  
  for (Word p: words) {
    p.display();
  }
  
  for (int i = words.size()-1; i >= 0; i--) {
    Word p = words.get(i);
    if (p.done()) {
      words.remove(i);
    }
  }
  
  
  
  saveFrame("vidframes/i-######.png");
  
}