import 'dart:math';

void main() {
  // JSON для круга
  Map<String, dynamic> circleJson = {
    "type": "circle",
    "radius": 5
  };

  // JSON для прямоугольника
  Map<String, dynamic> rectJson = {
    "type": "rectangle",
    "width": 4,
    "height": 6
  };

  Shape circle = Shape.fromJson(circleJson);
  Shape rectangle = Shape.fromJson(rectJson);

  print("Circle area: ${circle.area()}");
  print("Rectangle area: ${rectangle.area()}");
}

/// Абстрактный класс
abstract class Shape {
  double area();

  /// Фабричный метод создания объектов
  factory Shape.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "circle":
        return Circle(json["radius"].toDouble());
      case "rectangle":
        return Rectangle(
          json["width"].toDouble(),
          json["height"].toDouble(),
        );
      default:
        throw Exception("Unknown shape type");
    }
  }
}

/// Круг
class Circle implements Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * radius * radius;
  }
}

/// Прямоугольник
class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}