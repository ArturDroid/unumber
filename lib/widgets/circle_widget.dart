import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleWidget extends StatelessWidget {
  final Color colorCircle;
  final Color colorText;
  final String digits;

  const CircleWidget({
    Key? key,
    required this.colorCircle,
    required this.colorText,
    this.digits = '0',
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: colorCircle, shape: BoxShape.circle),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 1.0),
          child: Text(
            digits,
            style: TextStyle(color: colorText, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
