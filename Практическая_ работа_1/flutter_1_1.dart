void main() {
  // Объявление переменных
  int age = 58;
  double averageGrade = 4.7;
  String name = "Владимир";
  bool isStudent = true;

  // Вывод значений и типов данных
  print("Имя: $name ${name.runtimeType}");
  print("Возраст: $age ${age.runtimeType}");
  print("Средний балл: $averageGrade ${averageGrade.runtimeType}");
  print("Студент: $isStudent ${isStudent.runtimeType}");
}