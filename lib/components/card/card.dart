import 'package:flutter/material.dart';
import 'package:plume_ui/config/default_color.dart';
import 'package:plume_ui/config/default_font.dart';

enum CardTypes {
  shadow,
  outline,
}

class CrCard<T> extends StatefulWidget {
  CrCard({
    Key? key,
    this.type = CardTypes.shadow,
    this.child,
    this.direction = Axis.vertical,
    this.round = true,
    Image? mediaImage,
    String? mediaTitle,
    String? mediaSubTitle,
    T? mediaContent,
    List<Widget> mediaActions = const [],
    this.expand,
    this.size = const Size(double.infinity, 280),
  }) : super(key: key) {
    // props check
    if (mediaContent is Widget) {
      assert(
          mediaTitle == null && mediaSubTitle == null && mediaActions.isEmpty);
    }

    if (child != null) {
      assert(mediaImage == null &&
          mediaTitle == null &&
          mediaSubTitle == null &&
          mediaContent == null &&
          mediaActions.isEmpty);
    }

    // initialize widgets
    mediaImageSize =
        Size(size.width, size.height > 0 ? size.height * 0.64 : 120);

    mediaImageWidget = ClipRect(
        child: SizedBox(
            width: mediaImageSize.width,
            height: mediaImageSize.height,
            child: FittedBox(fit: BoxFit.fitWidth, child: mediaImage)));

    mediaTitleWidget = mediaTitle != null
        ? Text(
            mediaTitle,
            style: FontStyle.h1,
          )
        : null;
    mediaSubTitleWidget = mediaSubTitle != null
        ? Text(
            mediaSubTitle,
            style: FontStyle.h3,
          )
        : null;
    mediaContentWidget = (() {
      if (mediaContent == null) return mediaContent;
      if (mediaContent is Widget) {
        return mediaContent;
      }
      if (mediaContent is String) {
        return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediaTitleWidget,
                  mediaSubTitleWidget,
                  Text(mediaContent, style: FontStyle.text),
                ].where((el) => el != null).toList() as List<Widget>));
      }
      throw Error("property 'mediaContent' only support String or Widget");
    })() as Widget?;

    mediaActionsWidget = (() {
      if (mediaActions.isEmpty) return null;
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: mediaActions,
      );
    })();
  }

  final CardTypes type;
  final Axis direction;
  final bool round;
  late final ClipRect? mediaImageWidget;
  late final Widget? mediaTitleWidget;
  late final Widget? mediaSubTitleWidget;
  late final Widget? mediaContentWidget;
  late final Widget? mediaActionsWidget;
  final Widget? expand;
  final Size size;
  final Widget? child;

  late final Size mediaImageSize;
  @override
  State<CrCard> createState() => _CrCardState();
}

class _CrCardState extends State<CrCard> {
  @override
  Widget build(BuildContext context) {
    final isShadow = widget.type == CardTypes.shadow;
    final isOutline = widget.type == CardTypes.outline;
    final width = widget.size.width;
    final height = widget.size.height;
    final isRound = widget.round;
    final direction = widget.direction;
    final mediaContentWidget = widget.mediaContentWidget;
    final mediaImageWidget = widget.mediaImageWidget;
    final mediaActionsWidget = widget.mediaActionsWidget;
    final child = widget.child;

    final shadow = isShadow
        ? [
            const BoxShadow(
                color: Grey.grey_3,
                offset: Offset(1.5, 1.5),
                blurRadius: 2.0,
                spreadRadius: 2.0)
          ]
        : null;

    final borderRadius = isRound ? BorderRadius.circular(16.0) : null;
    final decoration = BoxDecoration(
        color: Colors.white,
        boxShadow: shadow,
        borderRadius: borderRadius,
        border: isOutline ? Border.all(color: Grey.grey_3, width: 2.0) : null);

    final guessedContent = Builder(builder: (context) {
      if (child != null) {
        return child;
      }

      return ClipRRect(
          borderRadius: borderRadius,
          child: Flex(
            direction: direction,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mediaImageWidget,
              mediaContentWidget,
              mediaActionsWidget != null
                  ? Positioned(child: mediaActionsWidget, right: 0, bottom: 0)
                  : null,
            ].where((el) => el != null).toList() as List<Widget>,
          ));
    });

    return Container(
      constraints: BoxConstraints(minHeight: height, minWidth: width),
      decoration: decoration,
      child: guessedContent,
    );
  }
}
