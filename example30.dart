import 'dart:math';

class point {
  double x, y;

  point(this.x, this.y);

  double distanceTo(point other) {
    var dx = x - other.x;
    var dy = y - other.x;
    return sqrt(dx * dx + dy * dy);
  }
}

class point2 {
  double? x;
  double z = 0;
}

double X_ = 1.5;

class point3 {
  double? x = X_;
  double? y;
  late double? z = this.x;

  point3(this.x, this.y, this.z);
}

class point4 {
  final String name;
  final DateTime start = DateTime.now();

  point4(this.name);
}

class MyMath {
  static const double PI = 3.14159;
  static double sql(double x) {
    return x * x;
  }
}

class Rectangle {
  double left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);

  double get right => left + width;
  set right(double value) => left = value - width;

  @override
  String toString() {
    return 'Rectangle{left: $left, top: $top, width: $width, height: $height}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Rectangle) return false;

    return left == other.left &&
        top == other.top &&
        width == other.width &&
        height == other.height;
  }
}

void main() {
  // Khoi tao doi tuong
  var p1 = Point(0, 0);

  var p2 = Point(3, 3);
  double distance = p1.distanceTo(p2);
  print(distance.toStringAsFixed(2));

  var p3 = point2();
  print(p3.x); // getter
  print(p3.z);
  p3.z = 100; // setter
  print(p3.z);

  var p4 = point4("Tung");

  print(MyMath.PI);

  print(MyMath.sql(5));

  var rect = Rectangle(3, 4, 20, 15);
  print("====");
  print(rect.left);
  rect.right = 12;
  print(rect.left);
  print(rect);
}
