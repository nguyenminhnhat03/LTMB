/*
  Typedefs trogn dart là một cách ngắn gọn để tạo các alias 
  cho các kiểu dữ liệu hoặc hàm.
*/

typedef ListMapper<X> = Map<X, List<X>>;
typedef IntList = List<int>;

typedef StringList<X> = List<String>;
void main() {
  IntList l1 = [1, 2, 3, 4, 5];
  print(l1);

  IntList l2 = [1, 2, 3, 4, 5, 6, 7];
  print(l2);

  Map<String, List<String>> a1 = {};
  ListMapper<String> a2 = {};

  StringList<String> a3 = ['a', 'b', 'c'];
}
