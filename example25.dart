// record
// 1. Create a class with a method that prints "This is parent class" and its subclass with another method that prints "This is child class". Now, create an object for each of the class and call
// 1 - method of parent class by object of parent class
void main() {
  var r = ('first', a: 2, 5, 10.5); //Recorrd

  //v định nghĩa record có 2 giá trị
  var point = (123, 456);
  // định nghĩa person
  var person = (name: 'Alice', age: 25, 5);

  print(point.$1); // 123
  print(point.$2); // 456
  print(person.$1); // 5

  print(person.name); // Alice
  print(person.age); // 25
}
