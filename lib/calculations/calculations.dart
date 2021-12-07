class Calculations {
  String valueOneNumber(int a) {
    if (a > 22) {
      return (firstDigit(a) + secondDigit(a)).toString();
    }
    return a.toString();
  }

  String valueTwoNumber(int a, int b) {
    int result = a + b;
    if (result > 22) {
      return (firstDigit(result) + secondDigit(result)).toString();
    } else {
      return result.toString();
    }
  }

  String valueThreeNumber(int a, int b, int c) {
    int result = a + b + c;
    if (result > 22) {
      return (firstDigit(result) + secondDigit(result)).toString();
    }
    return result.toString();
  }

  String valueYear(int a) {
    int result =
        (firstDigit(a) + secondDigit(a) + thirdDigit(a) + lastDigit(a));
    if (result > 22) {
      return (firstDigit(result) + secondDigit(result)).toString();
    }
    return result.toString();
  }

  int firstDigit(int a) {
    String value = a.toString();
    return int.parse(value[0]);
  }

  int secondDigit(int a) {
    String value = a.toString();
    return int.parse(value[1]);
  }

  int thirdDigit(int a) {
    String value = a.toString();
    return int.parse(value[2]);
  }

  int lastDigit(int a) {
    if (a > 31) {
      String value = a.toString();
      return int.parse(value[3]);
    }
    return (a % 10);
  }
}
