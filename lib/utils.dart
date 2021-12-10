import 'dart:math';

int randomMagnification() {
  int randomInt = Random().nextInt(100);

  if (randomInt < 10) {
    // ×0: 10%
    return 0;
  } else if (randomInt < 30) {
    // ×2: 25%
    return 2;
  } else if (randomInt < 55) {
    // ×3: 20%
    return 3;
  } else if (randomInt < 70) {
    // ×5: 15%
    return 5;
  } else if (randomInt < 80) {
    // ×10: 10%
    return 10;
  } else if (randomInt < 88) {
    // ×20: 8%
    return 20;
  } else if (randomInt < 94) {
    // ×30: 6%
    return 30;
  } else if (randomInt < 99) {
    // ×50: 5%
    return 50;
  } else if (randomInt < 100) {
    // ×100: 1%
    return 100;
  }
  return 1;
}
