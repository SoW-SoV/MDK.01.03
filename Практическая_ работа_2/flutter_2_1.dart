import 'dart:math';

class MathProcessor {
  final List<double> numbers;

  MathProcessor(this.numbers);

  /// Метод высшего порядка:
  /// принимает функцию-обработчик и возвращает новый список
  List<double> process(double Function(double) handler) {
    return numbers.map(handler).toList();
  }

  /// Статический метод генерации случайных чисел
  static List<double> getRandomNumbers(int count,
      {double min = 0, double max = 100}) {
    final random = Random();
    return List.generate(
      count,
      (_) => min + random.nextDouble() * (max - min),
    );
  }
}

void main() {
  // Генерация случайных чисел
  List<double> data = MathProcessor.getRandomNumbers(10, min: 1, max: 50);

  // Создание объекта
  MathProcessor processor = MathProcessor(data);

  print("Original:");
  print(data);

  // Пример 1: квадрат
  print("\nSquared:");
  print(processor.process((x) => x * x));

  // Пример 2: умножение на 2
  print("\nDoubled:");
  print(processor.process((x) => x * 2));

  // Пример 3: округление
  print("\nRounded:");
  print(processor.process((x) => x.roundToDouble()));
}