import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button_group.dart';
import 'package:plume_ui/layout/demo_layout.dart';
import 'package:plume_ui/layout/demo_section.dart';
import './button.dart';

class CrButtonDemo extends StatelessWidget {
  const CrButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
      children: [
        DemoSection(
          title: "主题",
          children: [
            CrButton(
              text: "默认",
            ),
            CrButton(
              type: CrButtonType.primary,
              text: "主要",
            ),
            CrButton(
              type: CrButtonType.success,
              text: "成功",
            ),
            CrButton(
              type: CrButtonType.warning,
              text: "异常",
            ),
            CrButton(
              type: CrButtonType.danger,
              text: "警告",
            )
          ],
        ),
        DemoSection(title: "尺寸", children: [
          CrButton(
              type: CrButtonType.primary,
              size: CrButtonSize.large,
              text: "大按钮"),
          CrButton(type: CrButtonType.primary, text: "默认"),
          CrButton(
              type: CrButtonType.primary,
              size: CrButtonSize.small,
              text: "小按钮"),
          CrButton(
              type: CrButtonType.primary,
              size: CrButtonSize.mini,
              text: "迷你按钮"),
          CrButton(
              type: CrButtonType.primary,
              size: CrButtonSize.cell,
              text: "cell按钮"),
        ]),
        DemoSection(title: "文本按钮", children: [
          CrButton(text: "文本按钮", onlyText: true),
          CrButton(type: CrButtonType.primary, text: "文本按钮", onlyText: true),
          CrButton(type: CrButtonType.success, text: "文本按钮", onlyText: true),
          CrButton(type: CrButtonType.warning, text: "文本按钮", onlyText: true),
          CrButton(type: CrButtonType.danger, text: "文本按钮", onlyText: true),
        ]),
        DemoSection(title: "朴素按钮", children: [
          CrButton(text: "普通按钮"),
          CrButton(
            text: "普通按钮",
            type: CrButtonType.primary,
          ),
          CrButton(type: CrButtonType.primary, text: "朴素按钮", plain: true),
          CrButton(type: CrButtonType.success, text: "朴素按钮", plain: true),
          CrButton(type: CrButtonType.warning, text: "朴素按钮", plain: true),
          CrButton(type: CrButtonType.danger, text: "朴素按钮", plain: true),
        ]),
        DemoSection(title: "圆角按钮", children: [
          CrButton(
            text: "普通按钮",
            type: CrButtonType.primary,
          ),
          CrButton(text: "圆角按钮", type: CrButtonType.primary, round: true),
          CrButton(
              type: CrButtonType.primary,
              text: "朴素按钮",
              round: true,
              plain: true),
        ]),
        DemoSection(title: "带图标", children: [
          CrButton(text: "带图标", type: CrButtonType.primary, icon: Icons.share),
          CrButton(
              text: "右图标", type: CrButtonType.primary, rightIcon: Icons.share),
          CrButton(
              text: "右图标",
              type: CrButtonType.primary,
              rightIcon: Icons.share,
              round: true),
          CrButton(type: CrButtonType.primary, icon: Icons.share, round: true),
        ]),
        DemoSection(title: "不可点击", children: [
          CrButton(
            text: "不可点击",
            type: CrButtonType.primary,
            disabled: true,
          ),
          CrButton(
              type: CrButtonType.primary,
              text: "朴素按钮",
              plain: true,
              disabled: true),
          CrButton(
              type: CrButtonType.success,
              text: "朴素按钮",
              plain: true,
              disabled: true),
        ]),
        DemoSection(title: "载入状态", children: [
          CrButton(text: "不可点击", type: CrButtonType.primary, loading: true),
          CrButton(
              type: CrButtonType.primary,
              text: "朴素按钮",
              plain: true,
              loading: true),
          CrButton(
              type: CrButtonType.success,
              text: "圆角按钮",
              round: true,
              loading: true),
        ]),
        DemoSection(title: "按钮组", children: [
          CrButtonGroup(children: [
            CrButton(
              text: "按钮1",
              type: CrButtonType.primary,
            ),
            CrButton(text: "按钮2", type: CrButtonType.primary),
            CrButton(text: "按钮3", type: CrButtonType.primary),
          ]),
          CrButtonGroup(axis: Axis.vertical, children: [
            CrButton(
              text: "按钮1",
              type: CrButtonType.primary,
            ),
            CrButton(text: "按钮2", type: CrButtonType.normal),
            CrButton(text: "按钮3", type: CrButtonType.primary),
          ])
        ]),
      ],
    );
  }
}
