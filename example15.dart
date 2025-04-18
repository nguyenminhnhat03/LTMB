// Kiểu dữ liệu chuỗi trong Dart

// Chuỗi là một tập hợp kí tự UTF-16. Để khai báo một chuỗi trong Dart, bạn sử dụng cặp dấu nháy đơn hoặc dấu nháy kép.
void main() {
  String name = 'Dart';
  String name2 = "Dart";

  print(name);
  print(name2);

  // Chèn giá trin của một biểu thức, biến vào trong chuỗi : ${....}
  double diemToan = 9.5;
  double diemLy = 8.5;
  var s3 = 'Xin Chào $name, bạn đạt tổng điểm là: ${diemToan + diemLy}';
  print(s3);

  //tạo ra chuỗi nằm nhiều dòng
  var s4 = '''
Dòng 1
Dòng 2
Dòng 3
.....
''';

  var s5 = """
Dòng 1
Dòng 2
Dòng 3
.....
""";
  // kí tự đặc biệt
  var s6 = 'Dart\n String';
  print(s6);
  var s7 = r'Dart String';
  print(s7);

  var s8 = "Chuỗi 1 " + "Chuỗi 2";
  print(s8);
  var s9 =
      'Chuỗi '
      "Này "
      "là "
      "Một chuỗi";
  print(s9);
}
