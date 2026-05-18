void main() {
  printRange(3, 8);
  printRange(10, 5);
}

void printRange(int a, int b) {
  if (a == b) {
    print(a);
    return;
  }

  if (a < b) {
    print(a);
    printRange(a + 1, b);  // <- вот здесь рекурсивный вызов
  } else {
    print(a);
    printRange(a - 1, b);  // <- вот здесь рекурсивный вызов
  }
}