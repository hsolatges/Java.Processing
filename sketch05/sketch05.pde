color[] palette = {#f5aa05, #f77603, #f63230, #233a53};

PImage meteor;
int meteorSize = 70;
int lines = 10;

void setup () {
  noCursor();
  meteor = loadImage("meteor.png");
  size(400, 400);
  frameRate(25);
  noFill();
}

void drawLine(PVector v0, PVector v1) {
  line(v0.x, v0.y, v1.x, v1.y);  
}

void draw() {
  PVector p0 = new PVector(mouseX, mouseY);
  
  background(palette[2]);
  
  
  noStroke();
  ellipseMode(CENTER);
  fill(palette[1]);
  ellipse(mouseX, mouseY, width, height);
  fill(palette[0]);
  ellipse(mouseX, mouseY, width/2, height/2);
  
  for(int counter = 1 ; counter < lines ; counter++) {
    stroke(palette[3]);
    strokeWeight(1);
    PVector p1 = new PVector(width/2 + random(-width/1.1, width/1.1), height/2 +  + random(-height/1.1, height/1.1));
    
    PVector lerpV = PVector.lerp(p1, p0, random(.25, .80));
    drawLine(lerpV, p1);    
  }
  
  noStroke();
  fill(palette[0]);
  ellipse(mouseX, mouseY, meteorSize*1.1, meteorSize*1.1);
  image(meteor, mouseX-meteorSize/2, mouseY-meteorSize/2, meteorSize, meteorSize);
}

void mousePressed() {
  lines = 20;
  meteorSize = 20;
}
void mouseReleased() {
  lines = 10;
  meteorSize = 50;
}
