
JSONArray words;

ArrayList<Node> nodes;

int n = 800;

float force1th = 100;

float coefflight = 2;

PFont f;

float t;

float threshold = 60;
float threshold2 = 10;


void setup(){

  size(1280,720);

  t = 0;
  
  f = createFont("Helvetica",20);
  
  words = loadJSONArray("words.json");
  
  nodes = new ArrayList<Node>();
  
  for(int i = 0; i<n; i++){
    Node n = new Node();
    n.s = words.getString(i%words.size());
    n.angle = random(0,TWO_PI);
    n.ampli = random(width/20,width/2);
    n.v = random(0.001,0.01);
    n.i = i;
    nodes.add( n );
  }

}


void draw(){

  background(0);
  
  t = t+0.1;
  
  for(int i = 0; i<nodes.size(); i++){
    Node n = nodes.get(i);
    n.update();
    n.drawforblur();
  }
  
  filter(BLUR,6);
  
  for(int i = 0; i<nodes.size(); i++){
    Node n1 = nodes.get(i);
    for(int j = i+1; j<nodes.size(); j++){
      Node n2 = nodes.get(j);
      
      PVector v = n2.p.copy();
      v.sub(n1.p);
      float d = v.mag();
      if(d<n1.ampli*2*threshold/height && d>threshold2){
        stroke(255,255,255,150-150*d/threshold);
        noFill();
        line(n1.p.x,n1.p.y,n2.p.x,n2.p.y);
      }
    }
  }
  
  for(int i = 0; i<nodes.size(); i++){
    Node n = nodes.get(i);
    n.draw();
  }
  
  saveFrame("vidframes/i-######.png");
  
}