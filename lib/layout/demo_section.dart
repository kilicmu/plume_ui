import 'package:flutter/material.dart';
import 'package:plume_ui/config/default_font.dart';

class DemoSection extends StatefulWidget {
  const DemoSection({Key? key, this.children = const [], this.title = ""})
      : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  State<DemoSection> createState() => _DemoSectionState();
}

class _DemoSectionState extends State<DemoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: const TextStyle(fontSize: 20),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12.0,
              children: widget.children
                  .map((e) =>
                      Padding(padding: const EdgeInsets.all(8.0), child: e))
                  .toList(),
            ),
          ))
    ]);
  }
}
