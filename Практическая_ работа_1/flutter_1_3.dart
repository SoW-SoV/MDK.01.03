void main() {
  String word = "Flutter";
  String vowels = "aeiouyAEIOUY";

  int count = 0;

  // Подсчёт гласных букв
  for (int i = 0; i < word.length; i++) {
    if (vowels.contains(word[i])) {
      count++;
    }
  }

  // Вывод результата
  print("Слово: $word");
  print("Гласных букв: $count");
}