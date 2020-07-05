

color[] palette = {#3889C1, #FD99A9, #0E376F, #FDFDFD, #3A6BA5};
color[] bgColorSkipper (color[] palette, int index) {
  if(palette.length < 1) {
    return new color[0];
  }
  
  color[] mPalette = new color[palette.length-1];
  for(int i = 0; i < palette.length; i++) {
    if(i != index) {
      mPalette = append(mPalette, palette[i]);
    }
  }
  return mPalette;
};

int root = 8;
int lineWeight = 3;
float gap = 3 ;

int bgIndex = (int) random(palette.length);
color[] palette2 = bgColorSkipper(palette, bgIndex);

void drawSquare (float x, float y, int n, float sizeX, float sizeY) {
  int randColorIndex  = (int) random(0, palette2.length); 
  stroke(palette2[randColorIndex]);
  pushMatrix();
  translate(x*sizeX + random(0, gap), y*sizeY + random(0, gap));
  rect(0, 0, sizeX - lineWeight - gap, sizeY - lineWeight - gap);
  while(n > 1) {
   drawSquare(x, y, n-1, sizeX / (2*(n-1)), sizeY / (2*(n-1)));
   n--;
  }
  popMatrix();
}

void setup () {
  size(360, 360);
  frameRate(5);
  strokeWeight(lineWeight);
  noFill();
}

void draw() {
  background(palette[bgIndex]);
  float tileX = floor(width / root);
  float tileY = floor(height / root);  
  
  for(int i = 0; i < root ; i++) {
    for(int j = 0; j < root ; j++) {
      
      drawSquare(i, j, (int) random(1, 5), tileX, tileY);
    }
  }
}

void mouseClicked() {
  bgIndex = (int) random(palette.length);
  palette2 = bgColorSkipper(palette, bgIndex);
}
