import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unumber/Pages/graph_page.dart';
import 'dart:developer';
import 'package:unumber/calculations/calculations.dart';

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
  @override
  Widget build(BuildContext context) {
    _calculate() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const GraphPage(title: "Test title")),
      );
    }
    
    log('value1: ${Calculations().valueYear(1998)}');
    

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text(
                "Calculate",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                elevation: 2
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20))
          ],
        ),
      ),
    );
  }
}
