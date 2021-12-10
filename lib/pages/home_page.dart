import 'dart:developer';

import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:unumber/Pages/graph_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  bool _isDateCorrect = false;
  bool _isMonthCorrect = false;
  bool _isYearCorrect = false;
  bool _isButtonVisible = false;

  void _printTextToLog() {
    log('BUTTOOON PREEEESSSEEEDD');
  }

  void cleanAllTextField() {
    dateController.clear();
    monthController.clear();
    yearController.clear();
  }

  bool showButton() {
    return _isDateCorrect && _isMonthCorrect && _isYearCorrect;
  }

  bool dateValidateCalculation() {
    return 0 < int.parse(dateController.text) &&
        int.parse(dateController.text) < 32;
  }

  bool monthValidateCalculation() {
    return 0 < int.parse(monthController.text) &&
        int.parse(monthController.text) < 13;
  }

  void dateCheck() {
    setState(() {
      _isDateCorrect =
          dateController.text.isEmpty ? false : dateValidateCalculation();
      _isButtonVisible = showButton();
    });
  }

  void monthCheck() {
    setState(() {
      _isMonthCorrect =
          monthController.text.isEmpty ? false : monthValidateCalculation();
      _isButtonVisible = showButton();
    });
  }

  void yearCheck() {
    setState(() {
      _isYearCorrect = yearController.text.isNotEmpty ? true : false;
      _isButtonVisible = showButton();
    });
  }

  /*void monthCheck() {
    int _a = int.parse(monthController.text);
    if (0 < _a && _a <= 12) {
      setState(() {
        _isMonthCorrect = true;
        if (_isDateCorrect && _isYearCorrect) {
          setState(() {
            _isButtonVisible = true;
          });
        }
      });
    } else {
      setState(() {
        _isMonthCorrect = false;
        _isButtonVisible = false;
      });
    }
  }*/

  /*void yearCheck() {
    if (yearController.text.isNotEmpty) {
      setState(() {
        _isYearCorrect = true;
        if (_isDateCorrect && _isMonthCorrect) {
          setState(() {
            _isButtonVisible = true;
          });
        }
      });
    } else {
      setState(() {
        _isYearCorrect = false;
        _isButtonVisible = false;
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    dateController.addListener(dateCheck);
    monthController.addListener(monthCheck);
    yearController.addListener(yearCheck);
  }

  @override
  void dispose() {
    dateController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> fetchUserOrder() {
      return Future.delayed(const Duration(seconds: 1));
    }

    _calculate() async {
      await fetchUserOrder();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const GraphPage(title: "Test title")),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.menu, color: Colors.blue, size: 24.0),
                    onPressed: () => SlideDrawer.of(context)?.toggle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, top: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.refresh, color: Colors.blue, size: 24.0),
                    onPressed: cleanAllTextField,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                  child: Image.asset(
                    'images/happybirthday.png',
                    width: 270,
                    height: 150,
                  ),
                ),
              ],
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                '"Слова вместо чисел, и числа вместо слов."',
                style: TextStyle(
                  fontFamily: 'NocturnoBG',
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 75),
                    child: TextFormField(
                      controller: dateController,
                      textAlign: TextAlign.center,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      maxLength: 2,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        suffix: _isDateCorrect
                            ? Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                size: 10,
                                color: Colors.red,
                              ),
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    _isDateCorrect ? Colors.blue : Colors.red,
                                width: 2)),
                        border: OutlineInputBorder(),
                        labelText: 'Дата',
                        hintText: '31',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 75),
                      child: TextFormField(
                        controller: monthController,
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                          suffix: _isMonthCorrect
                              ? Icon(
                                  Icons.check,
                                  size: 10,
                                  color: Colors.green,
                                )
                              : Icon(
                                  Icons.close,
                                  size: 10,
                                  color: Colors.red,
                                ),
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _isMonthCorrect
                                      ? Colors.blue
                                      : Colors.red,
                                  width: 2)),
                          border: OutlineInputBorder(),
                          labelText: 'Месяц',
                          hintText: '12',
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 75),
                    child: TextField(
                      controller: yearController,
                      textAlign: TextAlign.center,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      maxLength: 4,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        suffix: _isYearCorrect
                            ? Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                size: 10,
                                color: Colors.red,
                              ),
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    _isYearCorrect ? Colors.blue : Colors.red,
                                width: 2)),
                        border: OutlineInputBorder(),
                        labelText: 'Год',
                        hintText: '2000',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText(showButton()
                    ? 'Нажмите кнопку расчитать'
                    : 'Введите дату рождения'),
              ],
              pause: Duration(milliseconds: 1000),
              repeatForever: true,
            ),

            //Text('Введи дату рождения',style: TextStyle(color: Colors.grey),),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                opacity: _isButtonVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: AnimatedButton(
                  height: 35,
                  width: 110,
                  enable: showButton(),
                  text: 'Расчитать',
                  isReverse: true,
                  selectedTextColor: Colors.lightBlueAccent,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  isSelected: false,
                  animationDuration: Duration(milliseconds: 900),
                  //textStyle: submitTextStyle,
                  backgroundColor: Colors.blue,
                  //borderColor: Colors.white,
                  borderRadius: 5,
                  borderWidth: 2,
                  onPress: _calculate,
                ),

                /*ElevatedButton(
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 2.0, color: Colors.blue),
                        primary: Colors.white,
                        elevation: 2),
                  ),*/
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 50)),

            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "© Powered by Friend's",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
