// Toán Tử Điều Kiện trong Dart
/* 
  - Toán tử điều kiện trong Dart giúp chúng ta kiểm tra một điều kiện nào đó và trả về giá trị tùy thuộc vào kết quả của điều kiện đó.
  - Cú pháp:
    - Biểu_thức_điều_kiện ? giá_trị_nếu_đúng : giá_trị_nếu_sai

  Biểu_thức_điều_kiện ? giá_trị_nếu_đúng
  nếu biểu thức điều kiện đúng thì giá trị trả về là giá_trị_nếu_đúng, ngược lại giá trị trả về là null.
  - Trong đó:
    - Biểu_thức_điều_kiện: là một biểu thức hoặc một điều kiện cần kiểm tra.
    - giá_trị_nếu_đúng: là giá trị trả về nếu điều kiện đúng.
    - giá_trị_nếu_sai: là giá trị trả về nếu điều kiện sai.
*/
void main() {
  var KiemTra= (100%2==0) ? "Số chẵn" : "Số lẻ";
  print(KiemTra);

  var x = 100;
  var y = x ?? 50;
  print(y); 

  int? z;
  y = z ?? 30;
  print(y); 
}