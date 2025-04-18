void main() {
  // Định Nghĩa

  // SET không chứa phần tử trùng lặp
  // SET không có thứ tự
  // Môi phần từ chỉ xuất hiện 1 lần

  //Cách khai báo
  Set<String> set1 = {'a', 'b', 'c'}; //Trực tiếp
  var set2 = <int>{1, 2, 3}; //Sử dụng var
  Set<String> set3 = Set(); //Set rỗng
  var set4 = Set<int>.from([1, 2, 2, 3]); //Từ List

  //Các phương thức
  //Thêm phần tử
  set1.add('d');
  set1.addAll({'e', 'f'});

  //Xóa phần tử
  set1.remove('a');
  set1.removeAll(['b', 'c']);
  set1.clear();

  //Kiểm tra
  print(set1.contains('a'));
  print(set1.containsAll(['a', 'b']));
  print(set1.isEmpty);

  // Các phép toán trên Set
  var set5 = [1, 2, 3];
  var set6 = [3, 4, 5];
}
