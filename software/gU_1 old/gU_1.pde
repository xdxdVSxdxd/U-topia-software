/*
 * This sketch uses the text drawn to an offscreen PGraphics to determine
 * what color and shape it will draw to each xy-coordinate on the main screen
 *
 * USAGE:
 * - move the mouse around to change the grid dimensions
 * - click the mouse to flip the drawing method used for respectively inside and outside the text  
 */

// SKETCH SETTINGS
color ELLIPSE_COLOR = color(0); // color of drawn ellipses
color LINE_COLOR = color(0, 125); // color of drawn lines
color PGRAPHICS_COLOR = color(0); // won't impact this sketch's visual outcome
int LINE_LENGTH = 25; // length of drawn lines
boolean reverseDrawing = false; // boolean to flip the drawing method (toggle with mouse)

PGraphics[] pg;

int c = 0;
int n = 1;
color clr = 0;

JSONArray topias;
String[] topia;

void loadTopias() {
  topias = loadJSONArray("words.json");
  topia = new String[topias.size()];
  for (int i = 0; i < topias.size(); ++i) {
    topia[i] = topias.getString(i);
  }
  println(topia[2]);
}

void setup() {
  size(1280, 720);
  
  loadTopias();
  String topia = topias.getString(45);

  for (int i = 0; i < topias.size(); ++i) {
    pg = new PGraphics[i];
  }
  // create and draw to PPraphics (see Getting Started > UsingPGraphics example)
  
}

void draw() {
  loadBuffer(c);
  // determine grid dimensions based on the mouse position and calculate resulting grid settings
  int gridHorizontal = (int) map(mouseX, 0, width, 30, 600); // number of horizontal grid cells (based on mouseX)
  int gridVertical = (int) map(mouseY, 0, height, 15, 400); // number of vertical grid cells (based on mouseY)
  float w = float(width) / gridHorizontal;
  float h = float(height) / gridVertical;
  float r = min(w, h);

  // draw shapes to the screen
  background(255);
  strokeWeight(0.5);
  for (int y=0; y<gridVertical; y++) {
    for (int x=0; x<gridHorizontal; x++) {
      float e_x = x * w;
      float e_y = y * h;
      for (int i=0; i<n; i++) {
        clr = pg[i].get(int(e_x), int(e_y)); // get PGraphics color at this coordinate
      }
      boolean textDrawn = (clr == PGRAPHICS_COLOR); // is the color equal to PGRAPHICS_COLOR (aka is there text here)
      // use the reverseDrawing boolean to flip the textDrawn boolean
      // thus in fact flipping the resulting displayed shapes
      if (reverseDrawing ? !textDrawn : textDrawn) {
        noStroke();
        fill(ELLIPSE_COLOR);
        ellipse(e_x, e_y, r, r);
      } else {
        stroke(LINE_COLOR);
        //line(e_x, e_y, e_x + LINE_LENGTH, e_y + LINE_LENGTH);
      }
    }
  }
}

void loadBuffer(int c) {

  float tw = 0;

  for (int i=0; i<n; i++) {
    println("offset: "+ width*i);
    translate(width*i,0);
    pg[i] = createGraphics(width, height, JAVA2D);
    pg[i].imageMode(CORNER);
    pg[i].beginDraw();
    pg[i].textSize(96);
    pg[i].textAlign(CENTER, CENTER);
    pg[i].fill(PGRAPHICS_COLOR);
    // pg[i].blend(pg[i],0,0,width,height,0,0,width,height,MULTIPLY);
    for (int j = 0; j < 4; ++j) {
      pg[i].text(topia[j], pg[i].width/2, pg[i].height/2);
      println("text" + i + ": " + textWidth(topia[j]));

    }
    pg[i].endDraw();
  }
}

void mousePressed() {
  reverseDrawing = !reverseDrawing; // toggle boolean for drawing method
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      c++;
      if (c >= topias.size()) {c=0;} 
      println("UP" + c);
    } else if (keyCode == DOWN) {
      c--;
      if (c < 0) {c=topias.size();} 
      println("DOWN" + c);
    }
  }
}