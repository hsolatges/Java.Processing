color[] style = { #4ee9f7, #b24ff7, #f7db1f, #f71f66, #f7b71f, #dbf71f };

float noiseScale = 0.02;
float x, y;
float dim = 40.0;
float velocity = 5;
int sign = 1;

void setup() {
  size(300, 100);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  x += sign*velocity*noise((mouseX+x)*noiseScale, mouseY*noiseScale);
  if (x > floor(width - dim) || x < 0 ) {
   velocity = min(velocity * (1.075), 10);
   sign *= -1;
   
   int rand = (int) random(0, style.length-1);
   background(style[rand]);
   fill(style[style.length-rand-1]);
  }
  translate(x, height/2-dim/2);
  rect(0, 0, dim, dim);
}
