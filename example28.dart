void main() {
  int x = 100;
  if (x is int) {
    print("Positive integer");
  } else if (x % 2 == 0) {
    print("Even number");
  } else {
    print("Not a positive integer");
  }

  int thang = 5;
  switch (thang) {
    case 2:
      print("Tháng $thang có 28 hoặc 29 ngày");
      break;
    case 4:
    case 6:
    case 9:
    case 11:
      print("Tháng $thang có 30 ngày");
      break;

    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      print("Tháng $thang có 31 ngày");
      break;
    default:
      print(" $thang Không phải tháng trong năm");
  }
}
