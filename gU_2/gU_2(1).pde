import processing.video.*;

Movie movie;

//char[] chars ={'.',':','t','u','t','i','U','O','p','a','o','@'};
char[] chars ={'.',':','-','=','u','t','O','p','i','a','@'};
String loadPath = "MonaLisa.png";
PImage picture;
int devisions = 10; // pixels
PFont font;
float xDiv;
float yDiv;

void setup(){
  // picture = loadImage(loadPath);
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  movie = new Movie(this, "transit.mov");
  movie.loop();

  font = createFont("ocrastd.ttf", 12); 
  xDiv = movie.width/devisions;
  yDiv = movie.height/devisions;
  println(xDiv);
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  background(255);
  textFont(font,devisions+3);
//  image(movie, 0, 0, width, height);
  for(int i = 0; i < height; i+= devisions){
    for(int j = 0; j < width; j+= devisions){
      color filler = movie.get(int(j),int(i));
      fill(filler);
      textAlign(CENTER);
      //gets char depending on brightness
      float value = brightness(filler);
      char charac = chars[int(value/25.5)];
      text(charac,(j),(i));
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      devisions++;
    } else if (keyCode == DOWN) {
      devisions--;
    } 
  }
  constrain(devisions,1,99);
}

