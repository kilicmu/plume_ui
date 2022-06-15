import 'package:flutter/material.dart';
import 'package:plume_ui/config/default_color.dart';

enum CardTypes {
  shadow,
  outline,
}

class CrCard extends StatefulWidget {
  CrCard(
      {Key? key,
      this.type = CardTypes.shadow,
      this.child,
      this.direction = Axis.vertical,
      this.mediaImage,
      this.mediaTitle,
      this.mediaSubTitle,
      this.mediaContent,
      this.mediaActions,
      this.expand,
      this.width = double.infinity})
      : super(key: key) {
    if (child != null) {
      assert(mediaImage == null &&
          mediaTitle == null &&
          mediaSubTitle == null &&
          mediaContent == null &&
          mediaActions == null);
    }
  }
  final double? width;
  final CardTypes type;
  final Axis direction;
  final Image? mediaImage;
  final String? mediaTitle;
  final String? mediaSubTitle;
  final String? mediaContent;
  final Widget? mediaActions;
  final Widget? expand;
  final Widget? child;
  @override
  State<CrCard> createState() => _CrCardState();
}

class _CrCardState extends State<CrCard> {
  @override
  Widget build(BuildContext context) {
    final isShadow = widget.type == CardTypes.shadow;
    final isOutline = widget.type == CardTypes.outline;
    final direction = widget.direction;
    final mediaImage = widget.mediaImage;
    final child = widget.child;
    final shadow = [
      isShadow
          ? const BoxShadow(
              color: Grey.grey_3,
              offset: Offset(1.5, 1.5),
              blurStyle: BlurStyle.outer,
              blurRadius: 2.0,
              spreadRadius: 2.0)
          : null
    ].takeWhile((value) => value != null).toList() as List<BoxShadow>;

    final decoration = BoxDecoration(
        color: Colors.white,
        boxShadow: shadow,
        border: isOutline ? Border.all(color: Grey.grey_5, width: 2.0) : null);

    final guessedContent = Builder(builder: (context) {
      if (child != null) {
        return child;
      }
      final image = Container(height: 240.0);
      return Flex(direction: direction, children: [image]);
    });

    return Container(
      width: widget.width,
      decoration: decoration,
      child:
          Padding(padding: const EdgeInsets.all(12.0), child: guessedContent),
    );
  }
}
