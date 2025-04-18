class Product {
  String name;
  double price;
  int quantity;

  Product(this.price, {this.quantity = 0, this.name = ""});

  void showTotal() {
    print("Total price is: ${price * quantity}");
  }
}

class Tablet extends Product {
  double width = 0;
  double height = 0;

  Tablet(this.width, this.height, double price) : super(price, quantity: 1) {
    this.name = "Ipad Pro";
  }
  @override
  void showToTal() {
    print("Name Tablet is: $name");
    super.showTotal();
  }
}

void main() {
  var tablet = Tablet(6, 8, 600);
  tablet.showTotal();
}
