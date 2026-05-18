import 'dart:io';

// ---------- ВВОД МАТРИЦЫ ----------
List<List<double>> inputMatrix(int rows, int cols) {
  List<List<double>> matrix = [];

  print("Введите элементы матрицы построчно:");

  for (int i = 0; i < rows; i++) {
    List<double> row = [];
    while (true) {
      try {
        stdout.write("Строка ${i + 1} (через пробел): ");
        List<String> parts = stdin.readLineSync()!.trim().split(" ");

        if (parts.length != cols) {
          throw Exception("Нужно ровно $cols чисел!");
        }

        row = parts.map((e) => double.parse(e)).toList();
        break;
      } catch (e) {
        print("Ошибка ввода. Попробуйте снова.");
      }
    }
    matrix.add(row);
  }

  return matrix;
}

// ---------- ВЫВОД ----------
void printMatrix(List<List<double>> m) {
  for (var row in m) {
    print(row);
  }
}

// ---------- СЛОЖЕНИЕ ----------
List<List<double>> add(
    List<List<double>> a, List<List<double>> b) {
  int r = a.length;
  int c = a[0].length;

  List<List<double>> res = List.generate(
      r, (i) => List.generate(c, (j) => a[i][j] + b[i][j]));

  return res;
}

// ---------- ВЫЧИТАНИЕ ----------
List<List<double>> subtract(
    List<List<double>> a, List<List<double>> b) {
  int r = a.length;
  int c = a[0].length;

  List<List<double>> res = List.generate(
      r, (i) => List.generate(c, (j) => a[i][j] - b[i][j]));

  return res;
}

// ---------- УМНОЖЕНИЕ НА ЧИСЛО ----------
List<List<double>> multiplyByNumber(
    List<List<double>> a, double num) {
  return a
      .map((row) => row.map((e) => e * num).toList())
      .toList();
}

// ---------- УМНОЖЕНИЕ МАТРИЦ ----------
List<List<double>> multiplyMatrix(
    List<List<double>> a, List<List<double>> b) {
  int r = a.length;
  int c = b[0].length;
  int n = b.length;

  List<List<double>> res =
      List.generate(r, (_) => List.filled(c, 0.0));

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      for (int k = 0; k < n; k++) {
        res[i][j] += a[i][k] * b[k][j];
      }
    }
  }

  return res;
}

// ---------- ТРАНСПОНИРОВАНИЕ ----------
List<List<double>> transpose(List<List<double>> a) {
  int r = a.length;
  int c = a[0].length;

  List<List<double>> res =
      List.generate(c, (_) => List.filled(r, 0.0));

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      res[j][i] = a[i][j];
    }
  }

  return res;
}

// ---------- ОПРЕДЕЛИТЕЛЬ (2x2 и 3x3) ----------
double determinant(List<List<double>> a) {
  int n = a.length;

  if (n == 2) {
    return a[0][0] * a[1][1] - a[0][1] * a[1][0];
  }

  if (n == 3) {
    return a[0][0] *
            (a[1][1] * a[2][2] - a[1][2] * a[2][1]) -
        a[0][1] *
            (a[1][0] * a[2][2] - a[1][2] * a[2][0]) +
        a[0][2] *
            (a[1][0] * a[2][1] - a[1][1] * a[2][0]);
  }

  throw Exception("Определитель поддерживается только для 2x2 и 3x3");
}

// ---------- MAIN ----------
void main() {
  print("=== КАЛЬКУЛЯТОР МАТРИЦ ===");

  try {
    stdout.write("Введите количество строк A: ");
    int r1 = int.parse(stdin.readLineSync()!);

    stdout.write("Введите количество столбцов A: ");
    int c1 = int.parse(stdin.readLineSync()!);

    var a = inputMatrix(r1, c1);

    print("\nМатрица A:");
    printMatrix(a);

    print("\n1 - сложение (нужна вторая матрица)");
    print("2 - вычитание (нужна вторая матрица)");
    print("3 - умножение на число");
    print("4 - транспонирование");
    print("5 - определитель (2x2 или 3x3)");
    print("6 - умножение матриц");

    stdout.write("Выберите операцию: ");
    int choice = int.parse(stdin.readLineSync()!);

    List<List<double>> result;

    switch (choice) {
      case 1:
        print("Вторая матрица:");
        var b = inputMatrix(r1, c1);
        result = add(a, b);
        printMatrix(result);
        break;

      case 2:
        print("Вторая матрица:");
        var b = inputMatrix(r1, c1);
        result = subtract(a, b);
        printMatrix(result);
        break;

      case 3:
        stdout.write("Введите число: ");
        double num = double.parse(stdin.readLineSync()!);
        result = multiplyByNumber(a, num);
        printMatrix(result);
        break;

      case 4:
        result = transpose(a);
        printMatrix(result);
        break;

      case 5:
        print("Det = ${determinant(a)}");
        break;

      case 6:
        print("Введите вторую матрицу:");
        stdout.write("Строки B: ");
        int r2 = int.parse(stdin.readLineSync()!);
        stdout.write("Столбцы B: ");
        int c2 = int.parse(stdin.readLineSync()!);

        var b = inputMatrix(r2, c2);

        if (c1 != r2) {
          throw Exception("Нельзя перемножить: размеры не совпадают!");
        }

        result = multiplyMatrix(a, b);
        printMatrix(result);
        break;

      default:
        print("Неверный выбор");
    }
  } catch (e) {
    print("Ошибка: $e");
  }
}