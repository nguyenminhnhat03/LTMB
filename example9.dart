void main() {
  Object obj = 'Hello';
  //Kiểm tra obj có phải chuỗi(string ) hay không
  if (obj is String) {
    print('obj là một chuỗi');
  }
  //Kiểm tra không phải kiểu int
  if (obj is! int) {
    print('obj không phải kiểu int');
  }

  //Ép Kiểu
  String str = obj as String;
  print(str.toUpperCase());
}
