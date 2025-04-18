void main() {
  // các phép tính cơ bản : - Phép cộng trừ nhân chia, lấy số dư
  int a = 5 + 3;
  int b = 10 - 4;
  int c = 3 * 4;
  double d = 10 / 2;
  int e = 7 % 3; // chia lấy số dư = 1

  //Phép chia lấy phần nguyên
  int f = 7 ~/ 2;
  print(f);

  // phép gán và tính toán kết hợp
  int x = 10;
  x += 5; // x = x +5
  x -= 2; //x = x-2
  x ~/= 3; // x = x~/3

  // toán tử một ngôi : Tăng hoặc giảm(Có thể đặt trước hoặc sau)
  // ++ --
  int i = 100;
  i++; // i = i+1
  i--; //i=i-1
}
