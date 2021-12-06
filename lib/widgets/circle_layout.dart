import 'dart:math';

import 'package:flutter/cupertino.dart';

class CircleLayoutDelegate extends MultiChildLayoutDelegate {
  static const double _radiansPerDegree = pi / 180;
  final double _startAngle = -90.0 * _radiansPerDegree;

  final List<LayoutId> childs;
  final double radius;
  late Offset center;

  CircleLayoutDelegate({required this.childs, required this.radius});

  double _calculateItemAngle(int index) {
    double _itemSpacing = 360.0 / childs.length;
    return _startAngle + index * _itemSpacing * _radiansPerDegree;
  }

  @override
  void performLayout(Size size) {
    center = Offset(size.width / 2, size.height / 2);
    for (final child in childs) {
      if (hasChild(child.id)) {
        final Size buttonSize =
            layoutChild(child.id, BoxConstraints.loose(size));
        final double itemAngle = _calculateItemAngle(childs.indexOf(child));

        positionChild(
          child.id,
          Offset(
            (center.dx - buttonSize.width / 2) + (radius) * cos(itemAngle),
            (center.dy - buttonSize.height / 2) + (radius) * sin(itemAngle),
          ),
        );
      }
    }
  }

  @override
  bool shouldRelayout(CircleLayoutDelegate oldDelegate) =>
      childs.length != oldDelegate.childs.length || radius != oldDelegate.radius;
}
