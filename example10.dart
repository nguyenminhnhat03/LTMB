void main() {
  var a = 2;
  print(a);

  //??= => gán giá trị nếu biến đang null

  int? b;
  b ??= 5;
  print('b=$b');

  b ??= 10;
  print('b=$b');
}
