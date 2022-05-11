import 'package:flutter/material.dart';
import 'package:plume_ui/common/utils.dart';
import 'package:plume_ui/config/default_color.dart';
import 'package:plume_ui/config/default_font.dart';

class CrCell<PT> extends StatefulWidget {
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
  final PT? preview;
  final IconData? icon;
  final IconData? rightIcon;
  final Function()? onTap;

  @override
  State<CrCell> createState() => _CrCellState();
}

class _CrCellState extends State<CrCell> {
  bool isPressing = false;

  @override
  Widget build(BuildContext context) {
    final bkColor = isPressing ? Grey.grey_2 : Colors.white;
    final borderColor = Grey.grey_2;
    final heavyFontColor = chooseFontColorFromColor(bkColor, divide: 1);
    final normalFontColor = chooseFontColorFromColor(bkColor, divide: 2);
    final title = Text(widget.title,
        style: TextStyle(
            color: heavyFontColor,
            fontSize: FontSize.normal,
            textBaseline: TextBaseline.alphabetic));
    final subTitle = widget.subTitle != null
        ? Text(widget.subTitle!,
            style: TextStyle(fontSize: FontSize.small, color: normalFontColor))
        : null;
    // ignore: non_constant_identifier_names
    final Widget? PreviewWidget = () {
      if (widget.preview == null) {
        return null;
      }
      if (widget.preview is String) {
        return Text(widget.preview,
            style: TextStyle(fontSize: FontSize.small, color: normalFontColor));
      }
      if (widget.preview is Widget) {
        return widget.preview;
      }
      throw Error("preview type only support String or Widget");
    }();
    final icon =
        widget.icon != null ? Icon(widget.icon!, color: normalFontColor) : null;
    final rightIcon = widget.onTap != null
        ? widget.rightIcon == null
            ? Icon(Icons.chevron_right, color: normalFontColor)
            : Icon(widget.rightIcon, color: normalFontColor)
        : widget.rightIcon != null
            ? Icon(widget.rightIcon, color: normalFontColor)
            : null;
    final onCustomTap = widget.onTap;

    final titleRowChildren =
        [icon, title].where((e) => e != null).toList() as List<Widget>;
    final subTitleRowChildren =
        [subTitle, rightIcon].where((e) => e != null).toList() as List<Widget>;

    final mainColumnFirstLine = Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: titleRowChildren),
        Row(children: subTitleRowChildren)
      ],
    );
    final mainColumnChildren = <Widget>[mainColumnFirstLine];

    if (PreviewWidget != null) {
      mainColumnChildren.add(ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: Padding(
              padding: const EdgeInsets.only(top: 8.0), child: PreviewWidget)));
    }

    _onTapDown(detail) {
      if (onCustomTap == null) return;
      setState(() {
        isPressing = true;
      });
    }

    _onTapCancel() {
      if (onCustomTap == null) return;
      setState(() {
        isPressing = false;
      });
    }

    _onTapUp(detail) {
      if (onCustomTap == null) return;
      setState(() {
        isPressing = false;
        onCustomTap();
      });
    }

    return GestureDetector(
        onTapDown: _onTapDown,
        onTapCancel: _onTapCancel,
        onTapUp: _onTapUp,
        child: Container(
            constraints: const BoxConstraints(
                minHeight: 54.0, minWidth: double.infinity),
            decoration: BoxDecoration(
                color: bkColor, border: Border.all(color: borderColor)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Column(children: mainColumnChildren)]),
            )));
  }
}
