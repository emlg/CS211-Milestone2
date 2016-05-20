import java.util.*;

// declaration of our images
PImage img, houghImg, result;

void settings() {
  size(2*800 + 400, 600);
}

void setup() {
  img = loadImage("board1.jpg");
  result = createImage(img.width, img.height, RGB);
  noLoop();
}

void draw() {
  result = saturationMap(brightnessMap(hueMap(img, 96, 140), 38, 137), 116, 255);
  result = convolute(result);
  result = brightnessMap(result, 0, 153);
  result = sobel(result);
  List<PVector> lines = hough(result, 4);

  image(img, 0, 0);
  image(houghImg, img.width, 0);
  image(result, img.width + 400, 0);
 
  displayQuads(lines);
  getIntersections(lines);
  
}