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
    final name = ModalRoute.of(context)?.settings.arguments as String? ?? "";
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
            child: (Scrollbar(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: widget.children
                          .map((e) => Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: e))
                          .toList(),
                    ))))));
  }
}
