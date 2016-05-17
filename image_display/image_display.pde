import java.util.*;

void settings() {
  size(800, 600);
}

void setup() {
  img = loadImage("board2.jpg");
  result = createImage(width, height, RGB);

  for(int accPhi = 0; accPhi < phiDim; ang += discretizationStepsPhi, accPhi++){
    tabSin[accPhi] = (float) (Math.sin(ang) * inverseR);
    tabCos[accPhi] = (float) (Math.cos(ang) * inverseR);
  }
}

void draw() {
  result = hueMap(brightnessMap(saturationMap(img, 0.5, 1), 0.2, 0.6), 0.46, 0.53);
  result = sobel(convolute(binary(result, 15.f)));
  image(img, 0, 0);

  List<PVector> lines = hough(result, 6);
  List<int[]> quads = filterQuads(lines);

  for (int[] quad : quads) {
    PVector l1 = lines.get(quad[0]);
    PVector l2 = lines.get(quad[1]);
    PVector l3 = lines.get(quad[2]);
    PVector l4 = lines.get(quad[3]);

    PVector c12 = getIntersection(l1, l2);
    PVector c23 = getIntersection(l2, l3);
    PVector c34 = getIntersection(l3, l4);
    PVector c41 = getIntersection(l4, l1);

    // Choose a random, semi-transparent colour
    Random random = new Random();
    fill(color(min(255, random.nextInt(300)), 
      min(255, random.nextInt(300)), 
      min(255, random.nextInt(300)), 50));
    quad(c12.x, c12.y, c23.x, c23.y, c34.x, c34.y, c41.x, c41.y);
  }
}