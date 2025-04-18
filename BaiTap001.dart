/*
BÀI TẬP: Cấu trúc dữ liệu trong Dart
====================================
Bài 1: List
 
Có bao nhiêu cách để khai báo một List trong đoạn code? Liệt kê và giải thích từng cách.
Cho List ['A', 'B', 'C']. Viết code để:
 
Thêm phần tử 'D' vào cuối List
Chèn phần tử 'X' vào vị trí thứ 1
Xóa phần tử 'B'
In ra độ dài của List
 
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar list = [1, 2, 3, 4, 5];
list.removeWhere((e) => e % 2 == 0);
print(list);
 
Giải thích sự khác nhau giữa các phương thức:
 
remove() và removeAt()
add() và insert()
addAll() và insertAll()
 
====================================
Bài 2: Set
 
Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
Cho hai Set:
 
dartCopyvar set1 = {1, 2, 3};
var set2 = {3, 4, 5};
Tính kết quả của:
 
Union (hợp)
Intersection (giao)
Difference (hiệu) của set1 với set2
 
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
print(mySet.length);
 
===================================
Bài 3: Map
 
Viết code để thực hiện các yêu cầu sau với Map:
 
dartCopyMap<String, dynamic> user = {
  'name': 'Nam',
  'age': 20,
  'isStudent': true
};
 
Thêm email: 'nam@gmail.com'
Cập nhật age thành 21
Xóa trường isStudent
Kiểm tra xem Map có chứa key 'phone' không
 
 
So sánh hai cách truy cập giá trị trong Map:
 
dartCopyuser['phone']
user['phone'] ?? 'Không có số điện thoại'
 
Viết một hàm nhận vào một Map và in ra tất cả các cặp key-value, mỗi cặp trên một dòng.
 
 
====================================
Phần 4: Runes
 
Runes được sử dụng để làm gì? Cho ví dụ cụ thể.
Viết code để:
 
 
Tạo một Runes chứa ký tự emoji cười 😀
Chuyển đổi Runes đó thành String
In ra số lượng điểm mã của Runes
 
*/
//=======================================================

void main() {
  // Bài 1: List
  List<String> myList = ['A', 'B', 'C'];

  // Thêm phần tử 'D' vào cuối List
  myList.add('D');

  // Chèn phần tử 'X' vào vị trí thứ 1
  myList.insert(1, 'X');

  // Xóa phần tử 'B'
  myList.remove('B');

  // In ra độ dài của List
  print(myList.length);

  /*
  Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar list = [1, 2, 3, 4, 5];
list.removeWhere((e) => e % 2 == 0);
print(list);
    ==> [1, 3, 5]
  Giải thích sự khác nhau giữa các phương thức:
 
remove() và removeAt()
- remove(): Xóa phần tử đầu tiên có giá trị bằng với giá trị được cung cấp.
- removeAt(): Xóa phần tử tại vị trí chỉ định.

add() và insert()
- add(): Thêm một phần tử vào cuối List.
- insert(): Chèn một phần tử vào vị trí chỉ định trong List.

addAll() và insertAll()
- addAll(): Thêm tất cả các phần tử của một Collection vào cuối List.
- insertAll(): Chèn tất cả các phần tử của một Collection vào vị trí chỉ định trong List.

*/
  //=======================================================
  /*
Bài 2: Set
 
Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
- Set không cho phép các phần tử trùng lặp, trong khi List cho phép.
- Set không duy trì thứ tự của các phần tử, trong khi List duy trì thứ tự.
- Set có hiệu suất tìm kiếm phần tử tốt hơn so với List.
*/
  //Cho hai Set:

  var set1 = {1, 2, 3};
  var set2 = {3, 4, 5};

  //Tính kết quả của:

  // Union (hợp)
  var unionSet = set1.union(set2);
  print(unionSet); // {1, 2, 3, 4, 5}

  // Intersection (giao)
  var intersectionSet = set1.intersection(set2);
  print(intersectionSet); // {3}

  // Difference (hiệu) của set1 với set2
  var differenceSet = set1.difference(set2);
  print(differenceSet); // {1, 2}

  /*

Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
print(mySet.length);
== > 4
*/
  //=======================================================
  //Bài 3: Map
  Map<String, dynamic> user = {'name': 'Nam', 'age': 20, 'isStudent': true};
  // Thêm email: 'nam@gmail.com'
  user['email'] = 'nam@gmail.com';

  // Cập nhật age thành 21
  user['age'] = 21;

  // Xóa trường isStudent
  user.remove('isStudent');

  // Kiểm tra xem Map có chứa key 'phone' không
  bool containsPhone = user.containsKey('phone');
  print(containsPhone ? 'Có số điện thoại' : 'Không có số điện thoại');

  // So sánh hai cách truy cập giá trị trong Map
  print(user['phone']); // Trả về null nếu không có key 'phone'
  print(
    user['phone'] ?? 'Không có số điện thoại',
  ); // Trả về 'Không có số điện thoại' nếu không có key 'phone'

  // Hàm nhận vào một Map và in ra tất cả các cặp key-value, mỗi cặp trên một dòng
  void printMap(Map<String, dynamic> map) {
    map.forEach((key, value) {
      print('$key: $value');
    });
  }

  // Gọi hàm để in ra các cặp key-value của user
  printMap(user);
  //=======================================================
  // Bài 4: Runes
  // Runes được sử dụng để làm gì? Cho ví dụ cụ thể.
  // => Runes được sử dụng để biểu diễn các ký tự Unicode trong Dart.
  // Ví dụ: '😀' là một ký tự emoji cười, được biểu diễn bằng một chuỗi Runes

  // Tạo một Runes chứa ký tự emoji cười 😀
  Runes smiley = Runes('\u{1F600}');

  // Chuyển đổi Runes đó thành String
  String smileyString = String.fromCharCodes(smiley);

  // In ra số lượng điểm mã của Runes
  print('Số lượng điểm mã của Runes: ${smiley.length}');
  print('Ký tự emoji: $smileyString');
}
