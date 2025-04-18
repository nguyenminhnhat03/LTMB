mixin M {
  void showSomeThing() {
    print("Print messsenger....");
  }
}

class B {
  String name = "class B";
  void showImfomation() {
    print("Imformation class B");
  }
}

class C extends B with M {
  @override
  void showImformation() {
    showSomeThing();
  }
}

void main() {
  var c = C();
  c.showImfomation();
}
