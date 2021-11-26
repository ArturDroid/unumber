import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Приложение для нумеролога'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  late String getValue;
  int _counter = 0;
  int charLength1 = 0;
  int charLength2 = 0;

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  calculateAdd() {
    int value;
    return value =
        int.parse(myController1.text) + int.parse(myController2.text);
    ;
  }

  calculateSubtract() {
    int value;
    return value =
        int.parse(myController1.text) - int.parse(myController2.text);
  }

  calculateMultiply() {
    int value;
    return value =
        int.parse(myController1.text) * int.parse(myController2.text);
  }

  calculateDivide() {
    String answer;
    int value;
    return value =
        int.parse(myController1.text) ~/ int.parse(myController2.text);
  }

  _onChanged1(String value) {
    setState(() {
      charLength1 = value.length;
    });
  }

  _onChanged2(String value) {
    setState(() {
      charLength2 = value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          NewWidget(
            counter: _counter,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text('Here u see calculations'),
          ),
          TextField(
            controller: myController1,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the value',
              label: Text('Magic Number 1'),
              suffixIcon: Icon(Icons.arrow_back),
            ),
            onChanged: _onChanged1,
            //controller: myController,
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          TextField(
            controller: myController2,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the value',
              label: Text('Magic Number 2'),
              suffixIcon: Icon(Icons.arrow_back),
            ),
            onChanged: _onChanged2,
            keyboardType: TextInputType.number,
            maxLength: 3,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    if (charLength1 != 0 && charLength2 != 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(calculateAdd().toString()),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('add')),
              TextButton(
                  onPressed: () {
                    if (charLength1 != 0 && charLength2 != 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(calculateSubtract().toString()),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('subtract')),
              TextButton(
                  onPressed: () {
                    if (charLength1 != 0 && charLength2 != 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(calculateMultiply().toString()),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('multiply')),
              TextButton(
                  onPressed: () {
                    if (charLength1 != 0 && charLength2 != 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(calculateDivide().toString()),
                          );
                        },
                      );
                    }
                  },
                  child: const Text('divide')),
              TextButton(
                  onPressed: () {
                    myController1.clear();
                    myController2.clear();
                  },
                  child: const Text('clear')),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
