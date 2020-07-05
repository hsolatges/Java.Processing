color[] palette = {
  #D35E80,
  #EAD6B8,
  #B5F01F,
  #E6886E,
  #CAEDEB,
  #834586,
  #FDF7E7,
  #A0C1F0
};
int lengthMax = 5;

void setup() {
  frameRate(1);
  size(300, 500);
  strokeWeight(10);
  strokeJoin(ROUND);
}

void draw() {
  background(#2F2E40);
  
  for (int i = 0; i < palette.length; i++) {
    int[][] coordinates = new int[2][(int) random(lengthMax)];
  
    for(int n=0; n < coordinates[0].length; n++) {
        coordinates[0][n] = (int) random(width);
        coordinates[1][n] = (int) random(height);
    }
    
    stroke(palette[i]);
    
    for(int n=0 ; n < coordinates[0].length-1; n++) {
      line(coordinates[0][n], coordinates[1][n], coordinates[0][n+1], coordinates[1][n+1]);
    }
    if(coordinates[0].length > 0) {
      line(coordinates[0][coordinates[0].length-1], coordinates[1][coordinates[1].length-1], coordinates[0][0], coordinates[1][0]);
    }
  }  

}
