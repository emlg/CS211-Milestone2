PImage binary(PImage img, float threshold){
  PImage result = createImage(img.width, img.height, RGB);
  for(int i = 0; i < img.width * img.height; i++){
    if(brightness(img.pixels[i]) <= threshold)
        result.pixels[i] = color(0);
    else
        result.pixels[i] = color(255);
  }
  return result;
}

PImage inverted(PImage img, float threshold){
  PImage result = createImage(img.width, img.height, RGB);
  for(int i = 0; i < img.width * img.height; i++){
    if(brightness(img.pixels[i]) <= threshold)
        result.pixels[i] = color(255);
    else
        result.pixels[i] = color(0);
  }
  return result;
}