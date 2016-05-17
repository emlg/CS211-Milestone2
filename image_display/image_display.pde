import java.util.*;

void settings() {
  size(3*img_width, img_height);
}

void setup() {
  img = loadImage("board3.jpg");
  result = createImage(img.width, img.height, RGB);

  for(int accPhi = 0; accPhi < phiDim; ang += discretizationStepsPhi, accPhi++){
    tabSin[accPhi] = (float) (Math.sin(ang) * inverseR);
    tabCos[accPhi] = (float) (Math.cos(ang) * inverseR);
  }
}

void draw() {
  result = hueMap(brightnessMap(saturationMap(img, 0.31, 0.91), 0.21, 0.91), 0.40, 0.49); //HBS
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