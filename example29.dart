void main() {
  for (var i = 1; i <= 5; i++) {
    print(i);
  }

  var names = ["Alice", "Bob", "Charlie"];
  for (var name in names) {
    print(name);
  }

  var i = 1;
  while (i <= 5) {
    print(i);
    i++;
  }

  var y = 1;
  do {
    print(y);
    y++;
  } while (y <= 5);

  // break / contunue
  y = 1;
  do {
    print(y);
    y++;
    if (y == 3) {
      break;
    }
  } while (y <= 5);
  // Contunue
  y = 1;
  do {
    print(y);
    y++;
    if (y == 3) {
      continue;
    }
  } while (y <= 5);
}
