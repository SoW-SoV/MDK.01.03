import 'dart:io';

void main() {
  List<List<double>> matrixA = [
    [1, 2],
    [3, 4]
  ];

  List<List<double>> matrixB = [
    [5, 6],
    [7, 8]
  ];

  double number = 2;

  print("Матрица A:");
  printMatrix(matrixA);

  print("Матрица B:");
  printMatrix(matrixB);

  // Сложение
  print("Сложение матриц:");
  printMatrix(addMatrices(matrixA, matrixB));

  // Вычитание
  print("Вычитание матриц:");
  printMatrix(subtractMatrices(matrixA, matrixB));

  // Умножение на число
  print("Умножение матрицы A на число $number:");
  printMatrix(multiplyByNumber(matrixA, number));

  // Умножение матриц
  print("Умножение матриц A × B:");
  printMatrix(multiplyMatrices(matrixA, matrixB));

  // Транспонирование
  print("Транспонированная матрица A:");
  printMatrix(transposeMatrix(matrixA));

  // Определитель
  print("Определитель матрицы A:");
  print(determinant(matrixA));
}

// -------------------- СЛОЖЕНИЕ --------------------
List<List<double>> addMatrices(
    List<List<double>> a,
    List<List<double>> b) {

  if (a.length != b.length || a[0].length != b[0].length) {
    throw Exception("Ошибка: размеры матриц не совпадают.");
  }

  List<List<double>> result = [];

  for (int i = 0; i < a.length; i++) {
    List<double> row = [];

    for (int j = 0; j < a[i].length; j++) {
      row.add(a[i][j] + b[i][j]);
    }

    result.add(row);
  }

  return result;
}

// -------------------- ВЫЧИТАНИЕ --------------------
List<List<double>> subtractMatrices(
    List<List<double>> a,
    List<List<double>> b) {

  if (a.length != b.length || a[0].length != b[0].length) {
    throw Exception("Ошибка: размеры матриц не совпадают.");
  }

  List<List<double>> result = [];

  for (int i = 0; i < a.length; i++) {
    List<double> row = [];

    for (int j = 0; j < a[i].length; j++) {
      row.add(a[i][j] - b[i][j]);
    }

    result.add(row);
  }

  return result;
}

// -------------------- УМНОЖЕНИЕ НА ЧИСЛО --------------------
List<List<double>> multiplyByNumber(
    List<List<double>> matrix,
    double number) {

  List<List<double>> result = [];

  for (int i = 0; i < matrix.length; i++) {
    List<double> row = [];

    for (int j = 0; j < matrix[i].length; j++) {
      row.add(matrix[i][j] * number);
    }

    result.add(row);
  }

  return result;
}

// -------------------- УМНОЖЕНИЕ МАТРИЦ --------------------
List<List<double>> multiplyMatrices(
    List<List<double>> a,
    List<List<double>> b) {

  if (a[0].length != b.length) {
    throw Exception(
        "Ошибка: количество столбцов A должно быть равно количеству строк B.");
  }

  List<List<double>> result = List.generate(
    a.length,
    (_) => List.filled(b[0].length, 0),
  );

  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < b[0].length; j++) {
      for (int k = 0; k < b.length; k++) {
        result[i][j] += a[i][k] * b[k][j];
      }
    }
  }

  return result;
}

// -------------------- ТРАНСПОНИРОВАНИЕ --------------------
List<List<double>> transposeMatrix(List<List<double>> matrix) {

  List<List<double>> result = List.generate(
    matrix[0].length,
    (_) => List.filled(matrix.length, 0),
  );

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      result[j][i] = matrix[i][j];
    }
  }

  return result;
}

// -------------------- ОПРЕДЕЛИТЕЛЬ --------------------
double determinant(List<List<double>> matrix) {

  if (matrix.length != matrix[0].length) {
    throw Exception("Ошибка: определитель вычисляется только для квадратных матриц.");
  }

  int n = matrix.length;

  // Для матрицы 2x2
  if (n == 2) {
    return matrix[0][0] * matrix[1][1] -
           matrix[0][1] * matrix[1][0];
  }

  // Для матрицы 1x1
  if (n == 1) {
    return matrix[0][0];
  }

  double det = 0;

  for (int col = 0; col < n; col++) {
    det +=
        (col % 2 == 0 ? 1 : -1) *
        matrix[0][col] *
        determinant(getMinor(matrix, 0, col));
  }

  return det;
}

// -------------------- МИНОР --------------------
List<List<double>> getMinor(
    List<List<double>> matrix,
    int row,
    int col) {

  List<List<double>> minor = [];

  for (int i = 0; i < matrix.length; i++) {

    if (i == row) continue;

    List<double> newRow = [];

    for (int j = 0; j < matrix[i].length; j++) {

      if (j == col) continue;

      newRow.add(matrix[i][j]);
    }

    minor.add(newRow);
  }

  return minor;
}

// -------------------- ВЫВОД МАТРИЦЫ --------------------
void printMatrix(List<List<double>> matrix) {
  for (var row in matrix) {
    print(row);
  }
  print("");
}