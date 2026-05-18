void main() {
  Matrix a = Matrix([
    [1, 2],
    [3, 4]
  ]);

  Matrix b = Matrix([
    [5, 6],
    [7, 8]
  ]);

  print("Matrix A:");
  a.printMatrix();

  print("Matrix B:");
  b.printMatrix();

  print("A + B:");
  a.add(b).printMatrix();

  print("A * 2:");
  a.multiplyByNumber(2).printMatrix();

  print("A * B:");
  a.multiplyMatrix(b).printMatrix();
}

class Matrix {
  List<List<double>> data;
  int rows;
  int cols;

  Matrix(this.data)
      : rows = data.length,
        cols = data.isNotEmpty ? data[0].length : 0;

  /// Сложение матриц
  Matrix add(Matrix other) {
    List<List<double>> result = List.generate(rows, (i) {
      return List.generate(cols, (j) {
        return data[i][j] + other.data[i][j];
      });
    });

    return Matrix(result);
  }

  /// Умножение на число
  Matrix multiplyByNumber(double number) {
    List<List<double>> result = List.generate(rows, (i) {
      return List.generate(cols, (j) {
        return data[i][j] * number;
      });
    });

    return Matrix(result);
  }

  /// Умножение матриц
  Matrix multiplyMatrix(Matrix other) {
    List<List<double>> result =
        List.generate(rows, (i) => List.filled(other.cols, 0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < other.cols; j++) {
        for (int k = 0; k < cols; k++) {
          result[i][j] += data[i][k] * other.data[k][j];
        }
      }
    }

    return Matrix(result);
  }

  /// Печать матрицы
  void printMatrix() {
    for (var row in data) {
      print(row);
    }
    print("");
  }
}