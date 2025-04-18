void main() {
  List<String> list = ['a', 'b', 'c'];
  var list2 = [1, 2, 3];
  List<String> list3 = [];
  var list4 = List<int>.filled(3, 0);
  print(list4);

  // 1. Thêm phần tử
  list.add('d');
  list.addAll(['e', 'f']);
  list.insert(0, 'z');
  list.insertAll(2, ['x', 'y']);
  print(list);

  // 2. Xóa phần tử
  list.remove('z'); // xóa phần tử 'z'
  list.removeAt(0); // xóa phần tử ở vị trí 0
  list.removeLast(); // xóa phần tử cuối cùng
  list.removeRange(0, 2); // xóa phần tử từ vị trí 0 đến 2
  list.removeWhere((element) => element == 'f'); // xóa phần
  list.clear(); // xóa tất cả phần tử
  print(list);

  // 3. Cập nhật phần tử
  //list2[0] = 10;
  //list2.replaceRange(0, 2, [100, 200]);
  // print(list2);

  // Truy cập phần từ
  print(list2[0]); // Lấy phần tử tại vị trí 0
  print(list2.elementAt(0)); // Lấy phần tử tại vị trí 0
  print(list2.first); // Lấy phần tử đầu tiên
  print(list2.last); // Lấy phần tử cuối cùng
  print(list2.length); // Lấy độ dài phần tử

  // Kiểm Tra
  print(list2.isEmpty); // Kiểm tra list có rỗng không
  print(
    'List 3: ${list3.isNotEmpty ? 'Không rỗng' : 'Rỗng'}',
  ); // Kiểm tra list có rỗng không
  print(list4.contains(1));
  print(list4.contains(0));
  print(list4.indexOf(0)); // Trả về vị trí đầu tiên của phần tử 100
  print(list4.lastIndexOf(0)); // Trả về vị trí cuối cùng của phần tử 100

  // Sắp xếp
  list4 = [2, 1, 3, 9, 0, 10];
  print(list4);
  list4.sort();
  print(list4);
  //list4.sort((a, b) => b.compareTo(a));
  list4.reversed;
  print(list4.reversed);
  list4 = list4.reversed.toList();
  print(list4);

  //Cắt và nối
  var sublist = list4.sublist(1, 3); // Cắt list từ vị trí 1 đến 3
  print(sublist);

  var str = list4.join(', '); // Nối list thành chuỗi
  print(str);

  //duyệt các phần tử trong list
  list4.forEach((element) {
    print(element);
  }); // cách 1

  for (var i = 0; i < list4.length; i++) {
    print(list4[i]);
  } // cách 2
}
