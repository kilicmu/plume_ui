import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button.dart';

class CrButtonGroup extends StatelessWidget {
  CrButtonGroup(
      {Key? key, this.children = const [], this.axis = Axis.horizontal})
      : assert(children.length >= 2),
        super(key: key);

  Axis axis;
  List<CrButton> children;
  @override
  Widget build(BuildContext context) {
    Widget Wrapper;
    if (axis == Axis.horizontal) {
      bool $$roundLeftTop = false;
      bool $$roundRightTop = false;
      bool $$roundLeftBottom = false;
      bool $$roundRightBottom = true;
      children[0].$$roundLeftTop = true;
      children[0].$$roundLeftBottom = true;
      children[children.length - 1].$$roundRightTop = true;
      children[children.length - 1].$$roundRightBottom = true;
      return Row(children: children);
    }
    children[0].$$roundLeftTop = true;
    children[0].$$roundRightTop = true;
    children[children.length - 1].$$roundLeftBottom = true;
    children[children.length - 1].$$roundRightBottom = true;
    return Column(children: children);
  }
}
