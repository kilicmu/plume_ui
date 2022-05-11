import 'package:flutter/material.dart';
import 'package:plume_ui/components/cell/cell.dart';
import 'package:plume_ui/layout/demo_layout.dart';
import 'package:plume_ui/layout/demo_section.dart';

class CrCellDemo extends StatelessWidget {
  const CrCellDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
      children: [
        DemoSection(
          title: "默认",
          children: [
            CrCell(
                title: "俺是一个默认的 cell",
                subTitle: "详情",
                onTap: () {
                  Navigator.of(context).pushNamed("/cell");
                },
                preview: "preview1")
          ],
        )
      ],
    );
  }
}
