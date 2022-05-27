// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button.dart';
import 'package:plume_ui/components/cell/cell.dart';
import 'package:plume_ui/components/cell/cell_group.dart';
import 'package:plume_ui/layout/demo_layout.dart';
import 'package:plume_ui/layout/demo_section.dart';

class CrCellDemo extends StatelessWidget {
  const CrCellDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO Demo完善
    return DemoLayout(
      children: [
        DemoSection(
          title: "默认",
          children: [
            CrCell(
              title: "俺是一个默认的 cell",
            )
          ],
        ),
        DemoSection(title: "基础使用", children: [
          CrCell(title: "俺是标题", subTitle: "详情"),
          CrCell(
              title: "俺是标题",
              subTitle: "详情",
              preview: Text("这里是对标题内容的解释区域，主要目的是对标题和详情区文本或内容的补充说说说说明~🤔")),
          CrCell(
            preview: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("只设置preview，就是一个可定制 cell"),
                  CrButton(text: "🤔", size: CrButtonSize.cell)
                ]),
          )
        ]),
        DemoSection(
          title: "带图标",
          children: [
            CrCell(
                title: "加个图标，更有表达力~",
                icon: Icons.access_alarms,
                subTitle: "详情"),
            CrCell(
              title: "也可以试试放在右边👉🏻",
              rightIcon: Icons.access_alarm,
              subTitle: "详情",
            ),
            CrCell(
              title: "👈🏻两边都有也超酷👉🏻",
              icon: Icons.accessibility_new,
              rightIcon: Icons.access_alarm,
              subTitle: "详情",
            )
          ],
        ),
        DemoSection(
          title: "可点击",
          children: [
            CrCell(title: "默认可点击图标见右侧~", onTap: () {}),
            CrCell(
                title: "如果觉得挫，可以覆盖掉它 : (",
                rightIcon: Icons.abc_sharp,
                onTap: () {}),
          ],
        ),
        DemoSection(title: "Cell Group", children: [
          CrCellGroup(
            title: "有分组标题就会展示这里哦",
            cells: [
              CrCell(title: "多个 Cell 可以组成一个分组呀"),
              CrCell(
                title: "分组成员并不需要完全相同哦~",
                subTitle: "详情",
                rightIcon: Icons.accessible,
                preview: Text("这里是对标题内容的解释区域，主要目的是对标题和详情区文本或内容的补充说说说说明~🤔"),
              ),
            ],
          )
        ])
      ],
    );
  }
}
