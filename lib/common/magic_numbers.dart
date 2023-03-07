import 'dart:math';

// rotate the gradient by 150 degrees
const gradientRotation = 150 * pi / 180;

//center circle node at the vertical center of the screen and 200px from the top
//and extract the 30px offset from each card scrolled
double getTopOffsetOfBigNode(double screenHeight, double carouselOffset) {
  return screenHeight / 2 - 200 - carouselOffset * 30;
}

// push circle a bit to the left and extract the 60px offset from each card scrolled
// to make it look like it's moving with the cards
double getLeftOffsetOfBigNode(double carouselOffset) {
  return -100 - carouselOffset * 60;
}

// position circle node at 1/3 of the screen height and 150px from the top
// and add 60px offset for each card scrolled
double getTopOffsetOfSmallNode(double screenHeight, double carouselOffset) {
  return screenHeight / 3 - 150 + carouselOffset * 60;
}

// position circle node at 50px from the right
// and extract 60px offset for each card scrolled
double getRightOffsetOfSmallNode(double carouselOffset) {
  return 50 - carouselOffset * 60;
}

// position circle node at 60px from the top
// and extract 10px offset for each card scrolled
double getTopOffsetOfFrontUpperNode(double carouselOffset) {
  return 60 - carouselOffset * 10;
}

// position circle node at 10px from the left
// and add 50px offset for each card scrolled
double getLeftOffsetOfFrontUpperNode(double carouselOffset) {
  return 10 + carouselOffset * 50;
}

// add 60px for each card scrolled to the right
double getRightOffsetOfFrontLowerNode(double carouselOffset) {
  return carouselOffset * 60;
}