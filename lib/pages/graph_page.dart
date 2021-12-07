import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unumber/widgets/circle_layout.dart';
import 'package:widget_arrows/widget_arrows.dart';
import 'package:unumber/widgets/circle_widget.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  final List<LayoutId> items = [];

  @override
  void initState() {
    testDataFill();
    super.initState();
  }

  void testDataFill() {
    // List<String> testData = ["1", "2", "3"];
    // List<String> testData = ["1", "2", "3", "4", "5", "6"];
    List<String> testData = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    for (var data in testData) {
      items.add(LayoutId(
        id: data,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(10),
          child: MaterialButton(
            onPressed: () {},
            child: Text(data),
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ArrowContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  alignment: Alignment.center,
                  // decoration: const BoxDecoration(color: Colors.cyan),
                  child: _buildGraphView(),
                ),
              ),
            ),
            CircleWidget(
              colorCircle:  Colors.red,
              colorText: Colors.green,
              digits: '5',
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGraphView() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double outerRadius = min(width * 3 / 4, height * 3 / 4);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          _drawCircle(outerRadius + 5, Colors.redAccent),
          _drawCircle(outerRadius, Colors.transparent),
          CustomMultiChildLayout(
            delegate:
                CircleLayoutDelegate(childs: items, radius: outerRadius / 2),
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _drawCircle(double outerRadius, Color color) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 5),
          shape: BoxShape.circle,
          color: Colors.transparent),
      width: outerRadius,
      height: outerRadius,
    );
  }
}