void main() {
  Phone p1 = Phone("12345", "iPhone", 200);
  Phone p2 = Phone.withTwo("54321", "Samsung");
  Phone p3 = Phone.empty();

  print(p1.number);
  print(p1.model);
  print(p1.weight);

  print(p2.number);
  print(p2.model);
  print(p2.weight);

  print(p3.number);
  print(p3.model);
  print(p3.weight);

  p1.receiveCall("Alice");
  p2.receiveCall("Bob");
  p3.receiveCall("Charlie");

  print(p1.getNumber());
  print(p2.getNumber());
  print(p3.getNumber());

  p1.sendMessage(["11111", "22222", "33333"]);
  p2.sendMessage(["44444", "55555"]);
}

class Phone {
  String number;
  String model;
  double weight;

  // Конструктор с 3 параметрами
  Phone(this.number, this.model, this.weight);

  // Конструктор с 2 параметрами
  Phone.withTwo(this.number, this.model) : weight = 0;

  // Пустой конструктор
  Phone.empty()
      : number = "",
        model = "",
        weight = 0;

  void receiveCall(String name) {
    print("Звонит $name");
  }

  String getNumber() {
    return number;
  }

  void sendMessage(List<String> numbers) {
    for (var n in numbers) {
      print("Сообщение отправлено на $n");
    }
  }
}