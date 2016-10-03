
JSONArray words;
PFont f;

String[][] wa;
int maxlength = 0;

float fsize = 100;

int current = 0;

float t = 0;


void setup(){
  size(1270,720,P3D);
  words = loadJSONArray("words.json");
  f = createFont("OCRAStdRegular",fsize);
  
  for(int i = 0 ; i<words.size(); i++){
  
    if( words.getString(i).length()>maxlength){
      maxlength = words.getString(i).length();
    }
  }
  
  wa = new String[words.size()][maxlength];
  for(int i = 0; i<words.size(); i++){
    String s = words.getString(i);
    s = s.replaceAll("TOPIA","");
    for(int j = 0; j<maxlength; j++){
      String ss = " ";
      if(j<s.length()){
        ss = "" + s.charAt(j);
      }
      wa[i][j] = ss;
      //print(wa[i][j]);
    }
    //println("|");
  }
  
  for(int i = 0; i<words.size(); i++){
    while(wa[i][maxlength-1]==" "){
      String s = wa[i][maxlength-1];
      for(int j = maxlength-2; j>=0; j--){
        wa[i][j+1] = wa[i][j];
      }
      wa[i][0] = s;
    }
  }
  
}

void draw(){
  
  background(100+random(0,155),100+random(0,155),100+random(0,155));
  
  t = t + 0.4;
  if(t>PI){
    t = 0;
    current = current + 1;
    if(current>=wa.length){
      current = 0;
    }
  }
  
  textFont(f,fsize);
  textAlign(LEFT,CENTER);
  
  
  pushMatrix();
  translate(width/2 +random(-10,10), height/2 +random(-10,10) );
  text("TOPIA",0,0);
  popMatrix();
  for(int i = 0; i<maxlength; i++){
    float dx = width/2 - fsize*(maxlength-i);
    pushMatrix();
    translate(dx,height/2);
    rotateX(t+float(i)*TWO_PI/maxlength);
    fill(100+random(0,155),100+random(0,155),100+random(0,155));
    noStroke();
    text(wa[current][i],0,0);
    popMatrix();
  }
  
  saveFrame("frames/i-######.png");

}