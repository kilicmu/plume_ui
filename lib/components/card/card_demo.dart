import 'package:flutter/material.dart';
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
      DemoSection(title: "普通卡片", children: [
        CrCard(
            mediaImage: Image.network(
                'https://wx3.sinaimg.cn/mw2000/3c30266bgy1h27u6azjejj21sc2dsnpd.jpg'))
      ])
    ]);
  }
}
