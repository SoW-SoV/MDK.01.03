void main() {
  List<Student> students = [
    Student("Ivan", "Petrov", "A1", 5),
    Student("Anna", "Sidorova", "B2", 4.5),
    Aspirant("Pavel", "Ivanov", "C3", 5),
    Aspirant("Elena", "Smirnova", "D4", 4.8),
  ];

  for (var s in students) {
    print("${s.firstName} ${s.lastName}: ${s.getScholarship()}");
  }
}

class Student {
  String firstName;
  String lastName;
  String group;
  double averageMark;

  Student(this.firstName, this.lastName, this.group, this.averageMark);

  int getScholarship() {
    if (averageMark == 5) {
      return 2000;
    }
    return 1900;
  }
}

class Aspirant extends Student {
  String scientificWork;

  Aspirant(String firstName, String lastName, String group, double averageMark,
      {this.scientificWork = ""})
      : super(firstName, lastName, group, averageMark);

  @override
  int getScholarship() {
    if (averageMark == 5) {
      return 2500;
    }
    return 2200;
  }
}