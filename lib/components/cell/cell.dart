import 'package:flutter/material.dart';
import 'package:plume_ui/common/utils.dart';
import 'package:plume_ui/config/default_color.dart';
import 'package:plume_ui/config/default_font.dart';

class CrCell extends StatefulWidget {
  const CrCell(
      {Key? key,
      this.title = "",
      this.subTitle,
      this.preview,
      this.icon,
      this.rightIcon,
      this.onTap})
      : super(key: key);
  final String title;
  final String? subTitle;
  final Widget? preview;
  final IconData? icon;
  final IconData? rightIcon;
  final Function()? onTap;

  @override
  State<CrCell> createState() => _CrCellState();
}

class _CrCellState extends State<CrCell> {
  @override
  Widget build(BuildContext context) {
    final title = Text(widget.title,
        style: TextStyle(
            color: chooseFontColorFromColor(Colors.white),
            fontSize: FontSize.normal));
    final subTitle = widget.subTitle != null
        ? Text(widget.subTitle!,
            style: TextStyle(
                fontSize: FontSize.small,
                color: chooseFontColorFromColor(Colors.white, divide: 2)))
        : null;
    final PreviewWidget = widget.preview;
    final icon = widget.icon != null ? Icon(widget.icon!) : null;
    final rightIcon = widget.onTap != null
        ? widget.rightIcon == null
            ? const Icon(Icons.turn_slight_right)
            : Icon(widget.rightIcon)
        : widget.rightIcon != null
            ? Icon(widget.rightIcon)
            : null;
    final onCustomTap = widget.onTap;

    final titleRowChildren =
        [icon, title].where((e) => e != null).toList() as List<Widget>;
    final subTitleRowChildren =
        [subTitle, rightIcon].where((e) => e != null).toList() as List<Widget>;

    final mainColumnChildren = <Widget>[
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: titleRowChildren),
          Row(children: subTitleRowChildren)
        ],
      ),
    ];

    if (PreviewWidget != null) {
      mainColumnChildren.add(PreviewWidget);
    }

    return GestureDetector(
        child: Column(children: [
      Container(
          height: 54,
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Grey.grey_2)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
            child: Column(children: mainColumnChildren),
          ))
    ]));
  }
}
