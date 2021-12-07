class GraphData {
  //user birthday fields
  late final int day;
  late final int month;
  late final int year;

  //numbers
  late final int earthNumber; //1
  late final int waterNumber; //2
  late final int airNumber; //3
  late final int fireNumber; //4
  late final int shadowNumber; //5
  late final int leftAirAttitudeNumber; //6
  late final int waterAttitudeNumber; //7
  late final int rightAirAttitudeNumber; //8
  late final int earthAttitudeNumber; //9

  //links
  late final int earthLink; //1 to 5 link
  late final int waterLink; //2 to 5 link
  late final int airLink; //3 to 5 link
  late final int fireLink; //4 to 5 link
  late final int leftAirAttitudeLink; //6 to 5 link
  late final int waterAttitudeLink; //7 to 5 link
  late final int rightAirAttitudeLink; //8 to 5 link
  late final int earthAttitudeLink; //9 to 5 link

  //additional
  late final int engine;
  late final int leftAirAttitudeAddition; //6a
  late final int waterAttitudeAddition; //7a
  late final int rightAirAttitudeAddition; //8a
  late final int earthAttitudeAddition; //9a

  GraphData({required this.day, required this.month, required this.year}) {
    fillData();
  }

  void fillData() {
    //numbers calculation
    earthNumber = valueOneNumber(day);
    waterNumber =  (month < 10) ? month % 10 : month;
    airNumber = valueYear(year);
    fireNumber = valueOneNumber(earthNumber + waterNumber + airNumber);
    shadowNumber = valueOneNumber(earthNumber + waterNumber);
    leftAirAttitudeNumber = valueOneNumber(fireNumber + shadowNumber);
    waterAttitudeNumber = valueOneNumber(earthNumber + fireNumber);
    rightAirAttitudeNumber = valueOneNumber(waterNumber + fireNumber);
    earthAttitudeNumber = valueOneNumber(waterNumber + airNumber);

    //links calculation
    earthLink = valueOneNumber(shadowNumber + earthNumber);
    waterLink = valueOneNumber(shadowNumber + waterNumber);
    airLink = valueOneNumber(shadowNumber + airNumber);
    fireLink = valueOneNumber(shadowNumber + fireNumber);
    leftAirAttitudeLink = valueOneNumber(shadowNumber + shadowNumber);
    waterAttitudeLink = valueOneNumber(shadowNumber + leftAirAttitudeNumber);
    rightAirAttitudeLink = valueOneNumber(shadowNumber + waterAttitudeNumber);
    earthAttitudeLink = valueOneNumber(shadowNumber + rightAirAttitudeNumber);

    //additional calculation
    engine = valueOneNumber(earthNumber + leftAirAttitudeNumber);
    leftAirAttitudeAddition = valueOneNumber(shadowNumber + fireNumber);
    waterAttitudeAddition = valueOneNumber(leftAirAttitudeAddition + earthNumber);
    rightAirAttitudeAddition = valueOneNumber(leftAirAttitudeAddition + waterNumber);
    earthAttitudeAddition = valueOneNumber(waterAttitudeAddition + rightAirAttitudeAddition);
  }

  int valueOneNumber(int a) {
    return (a > 22) ? (firstDigit(a) + secondDigit(a)) : a;
  }

  int valueYear(int a) {
    int result =
        (firstDigit(a) + secondDigit(a) + thirdDigit(a) + fourthDigit(a));
    return (result > 22) ? (firstDigit(result) + secondDigit(result)) : result;
  }

  int fourthDigit(int a) {
    return ((a / 1000) % 10).toInt();
  }

  int thirdDigit(int a) {
    return ((a / 100) % 10).toInt();
  }

  int secondDigit(int a) {
    return ((a / 10) % 10).toInt();
  }

  int firstDigit(int a) {
    return (a % 10);
  }
}
