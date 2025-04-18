void main() {
  // int: kiểu số nguyên
  int x = 100;

  // double: kiểu số thực
  double y = 3.14;

  // num: kiểu số có thể là số nguyên, có thể là số thực
  num z = 100;
  num t = 3.14;

  // Chuyển chuỗi sang số
  var one = int.parse('1');
  print(one == 1 ? 'true' : 'false');

  /// chuyển chuỗi sang số thực
  var onePointOne = double.parse('1.1');
  print(onePointOne == 1.1 ? 'true' : 'false');

  // Chuyển số sang chuỗi
  String oneAsString = 1.toString();
  print(oneAsString == '1' ? 'true' : 'false');

  // Chuyển số thực sang chuỗi
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString == '3.14' ? 'true' : 'false');
}
