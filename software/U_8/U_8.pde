
Tree tree;
JSONArray words;

int nlev = 10;
float initialL = 200;
float initialDec = 0.6;
float da = PI/5;
float alp = 20;
float csize = 10;

PFont f;

float t = 0;

int iii = 0;

void setup(){
  size(1280,720);

  tree = new Tree();
  tree.construct(width/2, 3*height/4, nlev, initialL, initialDec, da);
  
  words = loadJSONArray("words.json");
  
  f = createFont("Arial",20);
  
}


void draw(){
  
  t = t + 0.01;
  
  iii++;
  
  if(iii>4000){
    noLoop();
  }
  
    nlev = 11;//round(4 + abs( 12*sin(0.01*t) ));
    initialL = 170;//40 + abs(137*sin(0.1*t));
    initialDec = 0.8; //0.02 + abs(0.9*sin(0.004*t));
    da = random( 0.7 , 1.9 );//0.9 + abs( (1.35-0.9)*sin(0.06*t) );
    alp = random(100,200);//90 + abs(165*sin(0.9*t));
    csize = random(6,18);//5 + abs( 7*sin(0.01*t) );
    
    
    tree = new Tree();
    tree.construct(width/2, 3*height/4, nlev, initialL, initialDec, da);
  
  /*
  if(random(0,100)>50){
    background(0);
    noStroke();
    fill(255,255,255,alp);
  } else {
    background(255,255,255);
    noStroke();
    fill(0,0,0,alp);
  }
  */
  
  background( random(40,255), random(40,255),random(40,255) );
  
  
  tree.draw();
  
  /*
  if(keyPressed){
    if(key=='q'){
      nlev--;
      println("nlev=" + nlev);
    } else if(key=='w'){
      nlev++;
      println("nlev=" + nlev);
    } else if(key=='a'){
      initialL=initialL-1;
      println("initialL=" + initialL);
    } else if(key=='s'){
      initialL=initialL+1;
      println("initialL=" + initialL);
    } else if(key=='z'){
      initialDec=initialDec-0.01;
      println("initialDec=" + initialDec);
    } else if(key=='x'){
      initialDec=initialDec+0.01;
      println("initialDec=" + initialDec);
    } else if(key=='r'){
      da=da-0.01;
      println("da=" + da);
    } else if(key=='t'){
      da=da+0.01;
      println("da=" + da);
    } else if(key=='f'){
      alp=alp-1;
      println("alp=" + alp);
    } else if(key=='g'){
      alp=alp+1;
      println("alp=" + alp);
    } else if(key=='v'){
      csize=csize-1;
      println("csize=" + csize);
    } else if(key=='b'){
      csize=csize+1;
      println("csize=" + csize);
    }
  
    if(nlev<1){nlev=1;}
    if(nlev>20){nlev=20;}
    if(alp<0){alp=0;}
    if(alp>255){alp=255;}
    if(csize<1){csize=1;}
    if(csize>50){csize=50;}
    if(initialDec>=0.9){ initialDec = 0.9; }
    */
    
    
  
    
    
    
  //}
  
  saveFrame("vidframes/i-######.png");
  
}