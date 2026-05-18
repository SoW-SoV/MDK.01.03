void main() {
  print(PasswordValidator.validate("1234567"));      // false (мало символов)
  print(PasswordValidator.validate("password"));      // false (нет цифры)
  print(PasswordValidator.validate("pass1234"));      // true
}

/// Класс проверки пароля
class PasswordValidator {
  // Константы требований
  static const int minLength = 8;

  /// Статический метод проверки пароля
  static bool validate(String password) {
    // 1. Проверка длины
    if (password.length < minLength) {
      return false;
    }

    // 2. Проверка наличия хотя бы одной цифры
    final hasDigit = password.contains(RegExp(r'\d'));

    return hasDigit;
  }
}