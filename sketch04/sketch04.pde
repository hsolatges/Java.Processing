float noiseScale = 0.02;
float tetha = 0;
float dtetha = 0.01;
float n = 1;
float radius(float angle) {
  return 2*angle + dtetha;
}

void setup() {
  size(600, 600);
  frameRate(500);
  smooth(10);
  strokeCap(ROUND);
  strokeWeight(3);
  hint(ENABLE_STROKE_PURE);
}


void draw() {
  float x = radius(tetha)*cos(tetha);
  float y = radius(tetha)*sin(tetha);
  float xNoise = 8 * noise(tetha*x*noiseScale, y*noiseScale);
  float yNoise = xNoise + 10 * noise(x*x*noiseScale, tetha*y*noiseScale);
  
  translate(width/2, height/2);
  point(x + xNoise * abs(x - width/2) / width/2, y + yNoise * abs(x - height/2) / height/2);

  tetha += dtetha / n;
  n += 0.0005;
}    
