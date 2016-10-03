JSONArray words;
String[] utopias;
String[] topias;
String[] ntopias;
char[][] chartopia;

int nftopias = 0;
int[] sp;
int strP = 200;

int c;
int kerning;
float w;
int ftsz = 100;
PFont f;
boolean b = true;

float t = 0;
int current = 0;
int maxlength = 0;

// float w;

void setup() {
	size(1920, 1080, P3D);
	words = loadJSONArray("words.json");
	nftopias = words.size();

	utopias = new String[nftopias];
	topias = new String[nftopias];
	ntopias = new String[nftopias];

	f = createFont("data/Monofur.ttf", ftsz);
  	textFont(f);

  	kerning = ftsz/8;
  	w = textWidth("M") + kerning;

  	wordsToUtopias();
  	utopiasToTopias();
  	stringsToChars();
  	setXPosition();
    maxlength = getLongerString();
}

void draw() {
	background(0);
	fill(255);

	translate(animationNoiseX(t,b), animationNoiseY(t,b));

	animation();
    charRotation();
        

//	rndmDisplayText();
//	testDisplay(c);
	textAlign(LEFT, CENTER);
	text("TOPIA", sp[7]+kerning/2, height/2);
}

void rndmDisplayText() {
	textAlign(RIGHT, CENTER);
	int c = int(random(0, 8));
	int r = int(random(0, nftopias));
	text(chartopia[r][c], sp[c], height/2);	
}

void testDisplay(int c) {
	textAlign(RIGHT, CENTER);
	text(chartopia[c+0][0], sp[0], height/2, 40);
	text(chartopia[c+1][1], sp[1], height/2, 40);
	text(chartopia[c+2][2], sp[2], height/2, 40);
	text(chartopia[c+3][3], sp[3], height/2, 40);
	text(chartopia[c+4][4], sp[4], height/2, 40);
	text(chartopia[c+5][5], sp[5], height/2, 40);
	text(chartopia[c+6][6], sp[6], height/2, 40);
	text(chartopia[c+7][7], sp[7], height/2, 40);
}

void animation() {
	t = t + 0.02;
	if(t>PI){
	    t = 0;
	    current = current + 1;
	    if(current>=chartopia.length){
	        current = 0;
	    }
	}
}

float animationNoiseX(float t, boolean b) {
	float xoff = 0.0;
	if (b) {
	    xoff += sin(t)*100;   // t xoff 
	} else {
		xoff = random(-10,10);
	}
	return xoff;
}

float animationNoiseY(float t, boolean b) {
	float yoff = 0.0;
	if (b) {
	    yoff += cos(t)*100; // t yoff
	} else {
		yoff = random(-10,10);
	}
	return yoff;
}


void charRotation() {
  for(int i = 0; i<maxlength; i++){
    // float dx = width/2 - ftsz*(maxlength-i);
    textAlign(RIGHT, CENTER);
    pushMatrix();
    translate(0,height/2);
    rotateX(t+float(i)*TWO_PI/maxlength);
    text(chartopia[current][i],sp[i],0);
    popMatrix();

  }
}

void setXPosition() {
	sp = new int[8];
	for (int j = 0; j < sp.length; ++j) {
		strP += w;
		// println("srtP: "+strP);
		sp[j] = strP;
	}
}

void wordsToUtopias() {
	for (int i = 0; i < nftopias; ++i) {
		utopias[i] = words.getString(i);
	}
}

void utopiasToTopias() {
	for (int i = 0; i < nftopias; ++i) {
		topias[i] = utopias[i].replaceAll("TOPIA","");
	}
}

int getLongerString() {
	int longest = 0;
	String str = "";
	for (int i = 0; i < nftopias; ++i) {
		if (longest < topias[i].length()) {
			longest = topias[i].length();
		}
	}
	return longest;
}

void stringsToChars() {

	int col = getLongerString();
	chartopia = new char[nftopias][col];

	for (int i = 0; i < nftopias; ++i) {
		int wtsp = col - topias[i].length();
		if (topias[i].length()<col) {
			for (int j = 0; j < wtsp; ++j) {
				chartopia[i][j] = ' ';
			}
			for (int j = 0; j < topias[i].length(); ++j) {
				chartopia[i][j+wtsp] = topias[i].charAt(j);
			}
		} else {
			for (int j = 0; j < topias[i].length(); ++j) {
				chartopia[i][j] = topias[i].charAt(j);
			}
		}
		for (int j = 0; j < col; ++j) {
			// print(chartopia[i][j]);
		}
		println('\r');
	}
}

void keyPressed() {
	if (key == CODED) {
	    if (keyCode == UP) {
	    	b = true;
	    	println("UP: true");
	    } else if (keyCode == DOWN) {
	    	b = false;
	    	println("DOWN: false");
	    }
	}
}






