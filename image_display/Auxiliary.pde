// declaration of our images
PImage img, acc, result;

// definition of the table constants
float discretizationStepsPhi = 0.06f;
float discretizationStepsR = 2.5f;
int phiDim = (int) (Math.PI / discretizationStepsPhi);

// pre-compute the sin and cos values
float[] tabSin = new float[phiDim];
float[] tabCos = new float[phiDim];
float ang = 0;
float inverseR = 1.f / discretizationStepsR;