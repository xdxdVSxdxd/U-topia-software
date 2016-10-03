class Tree{

  float x,y;

  ArrayList<Branch> branches;


  void construct(float initialX, float initialY, int nlevels, float initialLength, float decadence, float da){
  
    branches = new ArrayList<Branch>();
    
    x = initialX;
    y = initialY;
    
    PVector vinitial = new PVector(0,-1);
    vinitial.normalize();
    vinitial.mult( initialLength );
    
    Branch b = new Branch();
    b.x = x;
    b.y = y;
    b.v = vinitial;
    b.thick = nlevels;
    
    branches.add( b );
    
    nlevels--;
    
    if(nlevels>0){
      float l = initialLength*decadence;
      float xnext = x+vinitial.x;
      float ynext = y+vinitial.y;
      PVector vv = vinitial.copy();
      vv.normalize();
      vv.mult(l);
      vv.rotate(da);
      recurse(xnext,ynext,vv,nlevels,l,decadence,da);
      vv = vinitial.copy();
      vv.normalize();
      vv.mult(l);
      vv.rotate(-da);
      recurse(xnext,ynext,vv,nlevels,l,decadence,da);
    }
    
  }

  void recurse(float xnext, float ynext, PVector vvv, int nlevels, float l, float decadence, float da){
  
    PVector vinitial = vvv.copy();
    
    Branch b = new Branch();
    b.x = xnext;
    b.y = ynext;
    b.v = vinitial;
    b.thick = nlevels;
    
    branches.add( b );
    
    nlevels--;
    
    if(nlevels>0){
      float ll = l*decadence;
      float xxnext = xnext+vinitial.x;
      float yynext = ynext+vinitial.y;
      PVector vv = vinitial.copy();
      vv.normalize();
      vv.mult(l);
      vv.rotate(da);
      recurse(xxnext,yynext,vv,nlevels,ll,decadence,da);
      vv = vinitial.copy();
      vv.normalize();
      vv.mult(l);
      vv.rotate(-da);
      recurse(xxnext,yynext,vv,nlevels,ll,decadence,da);
    }
  
  }


  void draw(){
    for(int i = 0; i<branches.size();i++){
      Branch b = branches.get(i);
      //strokeWeight(b.thick);
      //line(b.x,b.y,b.x+b.v.x,b.y+b.v.y);
      fill(b.rr,b.gg,b.bb);
      pushMatrix();
      translate(b.x+b.v.x/2 , b.y+b.v.y/2 );
      rotate(b.v.heading());
      textFont(f,b.thick*csize);
      textAlign(CENTER,CENTER);
      text(words.getString(i%words.size()),random(-10,10),random(-10,10));
      popMatrix();
    }
  }

}