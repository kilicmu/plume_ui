import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button_group.dart';
import 'package:plume_ui/layout/demo_layout.dart';
import 'package:plume_ui/layout/demo_section.dart';
import './button.dart';

class PlButtonDemo extends StatelessWidget {
  const PlButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
      children: [
        DemoSection(
          title: "主题",
          children: [
            PlButton(
              text: "默认",
            ),
            PlButton(
              type: PlButtonType.primary,
              text: "主要",
            ),
            PlButton(
              type: PlButtonType.success,
              text: "成功",
            ),
            PlButton(
              type: PlButtonType.warning,
              text: "异常",
            ),
            PlButton(
              type: PlButtonType.danger,
              text: "警告",
            )
          ],
        ),
        DemoSection(title: "尺寸", children: [
          PlButton(
              type: PlButtonType.primary,
              size: PlButtonSize.large,
              text: "大按钮"),
          PlButton(type: PlButtonType.primary, text: "默认"),
          PlButton(
              type: PlButtonType.primary,
              size: PlButtonSize.small,
              text: "小按钮"),
          PlButton(
              type: PlButtonType.primary,
              size: PlButtonSize.mini,
              text: "迷你按钮"),
          PlButton(
              type: PlButtonType.primary,
              size: PlButtonSize.cell,
              text: "cell按钮"),
        ]),
        DemoSection(title: "文本按钮", children: [
          PlButton(text: "文本按钮", onlyText: true),
          PlButton(type: PlButtonType.primary, text: "文本按钮", onlyText: true),
          PlButton(type: PlButtonType.success, text: "文本按钮", onlyText: true),
          PlButton(type: PlButtonType.warning, text: "文本按钮", onlyText: true),
          PlButton(type: PlButtonType.danger, text: "文本按钮", onlyText: true),
        ]),
        DemoSection(title: "朴素按钮", children: [
          PlButton(text: "普通按钮"),
          PlButton(
            text: "普通按钮",
            type: PlButtonType.primary,
          ),
          PlButton(type: PlButtonType.primary, text: "朴素按钮", plain: true),
          PlButton(type: PlButtonType.success, text: "朴素按钮", plain: true),
          PlButton(type: PlButtonType.warning, text: "朴素按钮", plain: true),
          PlButton(type: PlButtonType.danger, text: "朴素按钮", plain: true),
        ]),
        DemoSection(title: "圆角按钮", children: [
          PlButton(
            text: "普通按钮",
            type: PlButtonType.primary,
          ),
          PlButton(text: "圆角按钮", type: PlButtonType.primary, round: true),
          PlButton(
              type: PlButtonType.primary,
              text: "朴素按钮",
              round: true,
              plain: true),
        ]),
        DemoSection(title: "带图标", children: [
          PlButton(text: "带图标", type: PlButtonType.primary, icon: Icons.share),
          PlButton(
              text: "右图标", type: PlButtonType.primary, rightIcon: Icons.share),
          PlButton(
              text: "右图标",
              type: PlButtonType.primary,
              rightIcon: Icons.share,
              round: true),
          PlButton(type: PlButtonType.primary, icon: Icons.share, round: true),
        ]),
        DemoSection(title: "不可点击", children: [
          PlButton(
            text: "不可点击",
            type: PlButtonType.primary,
            disabled: true,
          ),
          PlButton(
              type: PlButtonType.primary,
              text: "朴素按钮",
              plain: true,
              disabled: true),
          PlButton(
              type: PlButtonType.success,
              text: "朴素按钮",
              plain: true,
              disabled: true),
        ]),
        DemoSection(title: "载入状态", children: [
          PlButton(text: "不可点击", type: PlButtonType.primary, loading: true),
          PlButton(
              type: PlButtonType.primary,
              text: "朴素按钮",
              plain: true,
              loading: true),
          PlButton(
              type: PlButtonType.success,
              text: "圆角按钮",
              round: true,
              loading: true),
        ]),
        DemoSection(title: "按钮组", children: [
          PlButtonGroup(children: [
            PlButton(
              text: "按钮1",
              type: PlButtonType.primary,
            ),
            PlButton(text: "按钮2", type: PlButtonType.primary),
            PlButton(text: "按钮3", type: PlButtonType.primary),
          ]),
          PlButtonGroup(axis: Axis.vertical, children: [
            PlButton(
              text: "按钮1",
              type: PlButtonType.primary,
            ),
            PlButton(text: "按钮2", type: PlButtonType.normal),
            PlButton(text: "按钮3", type: PlButtonType.primary),
          ])
        ]),
      ],
    );
  }
}
