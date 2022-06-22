import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button.dart';
import 'package:plume_ui/components/card/card.dart';
import 'package:plume_ui/layout/demo_layout.dart';
import 'package:plume_ui/layout/demo_section.dart';

class CrCardDemo extends StatefulWidget {
  const CrCardDemo({Key? key}) : super(key: key);

  @override
  State<CrCardDemo> createState() => _CrCardDemoState();
}

class _CrCardDemoState extends State<CrCardDemo> {
  @override
  Widget build(BuildContext context) {
    return DemoLayout(children: [
      DemoSection(title: "默认卡片", children: [
        CrCard(
            size: Size.fromHeight(160.0),
            child: Container(
              child: Text("hello"),
            ))
      ]),
      DemoSection(title: "描边卡片", children: [
        CrCard(size: Size.fromHeight(160.0), type: CardTypes.outline)
      ]),
      DemoSection(
        title: "圆角卡片",
        children: [CrCard(size: Size.fromHeight(160.0), round: true)],
      ),
      DemoSection(title: "媒体卡片", children: [
        CrCard(
          mediaImage: Image.network(
            'https://wx3.sinaimg.cn/mw2000/3c30266bgy1h27u6azjejj21sc2dsnpd.jpg',
          ),
          direction: Axis.horizontal,
          size: Size.fromHeight(140.0),
          mediaTitle: "可能不错的标题",
          mediaSubTitle: "子标题yeahyeahyeah",
          mediaContent: "这里是内容.这里是内容这里是内容",
          mediaActions: [
            CrButton(
              size: CrButtonSize.small,
              type: CrButtonType.primary,
              onlyText: true,
              text: "取消",
            ),
            CrButton(
              size: CrButtonSize.small,
              type: CrButtonType.primary,
              onlyText: true,
              text: "确认",
            ),
          ],
        ),
        CrCard(
            mediaImage: Image.network(
              'https://wx3.sinaimg.cn/mw2000/3c30266bgy1h27u6azjejj21sc2dsnpd.jpg',
            ),
            direction: Axis.vertical,
            mediaTitle: "可能不错的标题",
            mediaSubTitle: "子标题yeahyeahyeah",
            mediaContent: "",
            mediaActions: [
              CrButton(
                size: CrButtonSize.mini,
                type: CrButtonType.primary,
                onlyText: true,
                text: "确认",
              )
            ],
            expand: Container(child: Text("hello")))
      ])
    ]);
  }
}
