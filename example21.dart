// kiểu dữ liệu
void main() {
  //Runners là tập hợp các điểm mã Unicode của một chuỗi
  // Cách khai báo
  String str = 'Hello';
  Runes runes1 = str.runes;

  Runes runne2 = Runes('\u2665 \u{1f605} \u{1f60e} \u{1f596}');
  print(runne2);

  Runes runne3 = Runes('\u{1f600}');
  print(runne3);

  String heart = String.fromCharCodes(runne2);
  print(heart);

  String emoji = String.fromCharCode(0x1F605);
  print(emoji);

  String symbol = String.fromCharCode(0x1F605);
  print(symbol);
}
