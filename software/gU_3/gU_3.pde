
/*
 U-TOPIA
 */

 JSONArray topias;
 int c = 0;
 PFont f;
 int kerning = 10;
 float w;
 int sp = 320;

 char[] minustopia;
 float[] xpos;
 
 String topia;
 int sotopia = 0;


 void loadTopias() {
  topias = loadJSONArray("words.json");
  println("topias: "+topias.getString(2));
}


void setup() {
  size(640, 360, P3D); // set dimensions to width 640, height 360

  loadTopias();
  f = createFont("data/Monofur.ttf", 80);
  textFont(f);
  

  w = textWidth("M") + kerning;

}


void draw() {
  background(255); 
  fill(0); 

  displayText(c);

  
}

void displayText(int c) {
  topia = topias.getString(c);
  parseString(topia);

  textAlign(RIGHT, CENTER);
  for (int i = sotopia-1; i >= 0; --i) {
  	text(minustopia[i], sp, height/2, 40);
  	sp -= w;
  }

  sp = 320;
  textAlign(LEFT, CENTER);
  text("TOPIA", sp+kerning/2, height/2, 40);
}


void parseString(String topia) {
	sotopia = topia.length()-5;
	// println("sotopia: "+sotopia);
	minustopia = new char[sotopia];
	for (int i = 0; i < sotopia; i++) {
		minustopia[i]=topia.charAt(i);
		// println(minustopia[i]);
	}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      c++;
      if (c >= topias.size()) {c=0;} 
      println("UP: " + c);
    } else if (keyCode == DOWN) {
      c--;
      if (c < 0) {c=topias.size()-1;} 
      println("DOWN: " + c);
    }
  }
}