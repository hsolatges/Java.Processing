/***********************************************
******************* MATHS **********************
************************************************/

/* Compute n! */
int factorial(int n) {
  int product = 1;
  while(n > 1) {
    product *= n;
    n--;
  }
  return product;
}

/* Swap two value of an IntList */
void swapInt(int i , int j, IntList l) {
  int temp = l.get(i);
  l.set(i, l.get(j));
  l.set(j, temp);
}

// Recursive Heap's algorithm: return ArrayList<IntList> of all permutations of IntList;
// https://en.wikipedia.org/wiki/Heap%27s_algorithm#Details_of_the_algorithm
void heapPermutations(int k, IntList l, ArrayList<IntList> a) { 
  if (k == 1) {
    a.add(l.copy());
  } else {
    heapPermutations(k-1, l, a);
    
    for (int i=0; i<k-1; i++) {
      if (k % 2 == 0) {
        swapInt(i, k-1, l);
      } else {
        swapInt(0, k-1, l);
      }
      heapPermutations(k-1, l, a);
    }
  }
};

/* Return a IntList filled with range [0..n] */
IntList mkRange(int n) {
  IntList l = new IntList(n);
  for(int i=0; i<n; i++) {
    l.set(i, i);
  }
  return l;
}

/* Return a copy of data with permuted element following permutation's pattern */
int[] permute (IntList permutation, int[] data) {
  int[] permuted = new int[data.length];
  for(int i = 0; i < data.length; i++) {
    permuted[i] = data[permutation.get(i)];
  }
  return permuted;
};


/***********************************************
****************** GRAPHICS ********************
************************************************/

// Fill a 2D array with values [0..255]
int[][] makeGrays(int w, int h) {
  int[][] grays =  new int[h][w];
  for (int i = 0; i < grays.length; i++) {
    for(int j = 0; j < grays[i].length; j++) {
      grays[i][j] = (int) random(0, 256);
    }
  }
  return grays;
};

// Params & inits
int dimX = 3;
int dimY = factorial(dimX);
int cellSizeX;
int cellSizeY;
int[][] grays = makeGrays(dimX, dimY);
IntList range = mkRange(dimX);
ArrayList<IntList> permutations = new ArrayList<IntList>(factorial(range.size()));

void setup() {
  size(300, 300);
  frameRate(1);
  noStroke();
  
  cellSizeX = floor(width / dimX);
  cellSizeY = floor(height / dimY);
  
  heapPermutations(range.size(), range, permutations);
  /* Prints all permutations
  for(IntList perm: permutations) {
    printArray(perm);
  }*/  
}

void draw() {
  // Mutate grays' data through permutations
  for(int i = 0; i < dimY; i++) {
    int[] data = permute(permutations.get(i), grays[i]);
    for(int j = 0; j < dimX; j++) {
      grays[i][j] = data[j];
    }
  }
  
  // Draw the grid 
  for (int i = 0; i < dimY; i++) {
    for(int j = 0; j < dimX; j++) {
      fill(grays[i][j]);
      pushMatrix();
      translate(j*cellSizeX, i*cellSizeY);
      rect(0, 0, cellSizeX, cellSizeY);
      popMatrix();
    }
  }
}
