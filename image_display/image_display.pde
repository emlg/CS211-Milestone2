import java.util.*;

void settings() {
  size(3*img_width, img_height);
}

void setup() {
  img = loadImage("board1.jpg");
  result = createImage(img.width, img.height, RGB);

  for(int accPhi = 0; accPhi < phiDim; ang += discretizationStepsPhi, accPhi++){
    tabSin[accPhi] = (float) (Math.sin(ang) * inverseR);
    tabCos[accPhi] = (float) (Math.cos(ang) * inverseR);
  }
}

void draw() {
  result = saturationMap(brightnessMap(hueMap(img, 0.376, 0.533), 0.1, 1.0), 0.44, 0.9);
  result = sobel(binary(convolute(result), 4));
  
  img.resize(img_width, img_height); 
  result.resize(img_width, img_height);
  
  List<PVector> lines = hough(result, 10);
  houghImg.resize(img_width, img_height);
  List<int[]> quads = filterQuads(lines);
  
  image(img, 0, 0);
  image(houghImg, img_width, 0);
  image(result, 2*img_width, 0);
  
  displayQuads(lines, quads);
  
}