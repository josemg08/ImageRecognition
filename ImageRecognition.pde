color trackColor;
PImage redCells;

void setup() {
  size(300,300);
  redCells = loadImage("normal-blood1.jpg");
  
  // Start off tracking for red
  trackColor = color(255,0,0);
  smooth();
}

void draw() {
  redCells.loadPixels();
  image(redCells,0,0,300,300);

  float worldRecord = 500; 

  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < redCells.width; x ++ ) {
    for (int y = 0; y < redCells.height; y ++ ) {
      int loc = x + y*redCells.width;
      // What is current color
      color currentColor = redCells.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 5) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX,closestY,16,16);
  }
}

void mrf (){
  
}
