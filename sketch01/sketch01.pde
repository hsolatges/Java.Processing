color[] palette = {#BC0E4C, #FFC501, #B5F01F, #354F60};

void setup() {
  background(#0C1411);
  frameRate(20);
  size(480, 600);
}

void draw() {
  for (color c : palette) {
    int radius = (int) random(30, 90);
    fill(c);
    noStroke();
    ellipse((int) random(width), (int) random(height), radius, radius);
  }
}
