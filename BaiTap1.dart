/*
Câu 1 : Viết một đoạn mã Dart để khai báo các kiểu dữ liệu khác nhau như
số nguyên, chuỗi kí tự và Boolean. Sau đó in các giá trị của các biến này ra console kết quả.

Câu 2:
Viết một hàm trong Dart tên là caculateSum và nhận 2 tham số nguyên 
và trả về tổng của chúng. Gọi hàm này trong chương trình chính 
và in kết quả ra màn hình 
*/

int calculateSum(int num1, int num2) {
  return num1 + num2;
}

void main() {
  // Câu 1:
  int a = 10;
  String b = "Hello";
  bool c = true;
  print(a);
  print(b);
  print(c);
  // câu 2
  int sum = calculateSum(5, 7);
  print("Tổng của 5 và 7 là: $sum");
}
