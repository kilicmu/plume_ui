import 'package:flutter/material.dart';

class DemoLayout extends StatefulWidget {
  DemoLayout({Key? key, this.children = const []}) : super(key: key);
  List<Widget> children;

  @override
  State<DemoLayout> createState() => _DemoLayoutState();
}

class _DemoLayoutState extends State<DemoLayout> {
  @override
  Widget build(BuildContext context) {
    return (Scrollbar(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: widget.children
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(top: 8.0), child: e))
                  .toList(),
            ))));
  }
}
