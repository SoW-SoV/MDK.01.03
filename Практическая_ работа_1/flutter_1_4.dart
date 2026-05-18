import 'dart:io';

void main() {
  print('=== Умный калькулятор ===');

  // Ввод первого числа
  print('Введите первое число:');
  double? a = double.tryParse(stdin.readLineSync() ?? '');

  // Ввод второго числа
  print('Введите второе число:');
  double? b = double.tryParse(stdin.readLineSync() ?? '');

  // Проверка ввода (null-safety + логический оператор)
  if (a == null || b == null) {
    print('Ошибка: введено не число!');
    return;
  }

  // Ввод оператора
  print('Введите оператор (+, -, *, /, %):');
  String op = stdin.readLineSync() ?? '';

  double? result;

  // Обработка операций
  switch (op) {
    case '+':
      result = a + b;
      break;
    case '-':
      result = a - b;
      break;
    case '*':
      result = a * b;
      break;
    case '/':
      // тернарный оператор + обработка ошибки
      result = (b != 0) ? a / b : null;
      if (result == null) {
        print('Ошибка: деление на ноль!');
        return;
      }
      break;
    case '%':
      // остаток от деления (с проверкой)
      result = (b != 0) ? a % b : null;
      if (result == null) {
        print('Ошибка: деление на ноль!');
        return;
      }
      break;
    default:
      print('Ошибка: неизвестный оператор!');
      return;
  }

  // Вывод результата
  print('Результат: $a $op $b = $result');
}