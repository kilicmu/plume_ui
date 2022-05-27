import 'package:flutter/material.dart';
import 'package:plume_ui/components/cell/cell.dart';
import 'package:plume_ui/config/default_color.dart';

class CrCellGroup extends StatefulWidget {
  CrCellGroup({Key? key, required List<CrCell> cells, this.title})
      : assert(cells.length >= 2),
        super(key: key) {
    for (var element in cells) {
      element.$$isGroupItem = true;
    }
    cells.first.$$isFirstGroupItem = true;
    cells.last.$$isFinalGroupItem = true;

    List<Widget> _cells = [];
    final len = cells.length - 1;
    for (var i = 0; i <= len; i++) {
      _cells.add(cells[i]);
      if (i != len) {
        _cells.add(const Divider(
          height: 1,
          indent: 14.0,
          endIndent: 14.0,
        ));
      }
    }
    this.cells = List.from(_cells);
  }
  late List<Widget> cells;
  final String? title;
  @override
  State<CrCellGroup> createState() => _CrCellGroupState();
}

class _CrCellGroupState extends State<CrCellGroup> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    if (title == null) {
      return Column(children: widget.cells);
    }
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Grey.grey_7)),
        Column(children: widget.cells)
      ],
    );
  }
}
