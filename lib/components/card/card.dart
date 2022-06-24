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
    this.round = false,
    Image? mediaImage,
    String? mediaTitle,
    String? mediaSubTitle,
    T? mediaContent,
    List<Widget> mediaActions = const [],
    this.expand,
    Size? size,
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

    if (size != null) {
      truthSize = size;
    } else {
      truthSize = () {
        if (direction == Axis.vertical) {
          return const Size(double.infinity, 280);
        } else {
          return const Size(double.infinity, 120);
        }
      }();
    }

    const filledFlex = 24;
    final mediaImageFlex = direction == Axis.vertical ? 14 : 8;

    mediaImageWidget = () {
      if (mediaImage == null) return null;
      var fit = BoxFit.fitWidth;
      return Expanded(
          flex: mediaImageFlex,
          child: ClipRect(
              child: SizedBox(
                  width: double.infinity,
                  height: truthSize.height,
                  child: FittedBox(fit: fit, child: mediaImage))));
    }();

    mediaTitleWidget = mediaTitle != null
        ? Text(
            mediaTitle,
            style: FontStyle.h2,
          )
        : null;
    mediaSubTitleWidget = mediaSubTitle != null
        ? Text(
            mediaSubTitle,
            style: FontStyle.h5,
          )
        : null;

    mediaActionsWidget = (() {
      if (mediaActions.isEmpty) {
        return null;
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: mediaActions,
      );
    })();

    mediaContentWidget = (() {
      if (mediaContent == null) return mediaContent;
      if (mediaContent is Widget) {
        return mediaContent;
      }

      if (mediaContent is String) {
        final _c = Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mediaTitleWidget,
                  mediaSubTitleWidget,
                  Expanded(
                      child: SingleChildScrollView(
                    child: Text(
                      mediaContent,
                      style: FontStyle.text,
                      softWrap: true,
                    ),
                  )),
                  mediaActionsWidget
                ].where((el) => el != null).toList() as List<Widget>));

        return Expanded(flex: filledFlex - mediaImageFlex, child: _c);
      }
      throw Error("property 'mediaContent' only support String or Widget");
    })() as Widget?;
  }

  final CardTypes type;
  final Axis direction;
  final bool round;
  late final Widget? mediaImageWidget;
  late final Widget? mediaTitleWidget;
  late final Widget? mediaSubTitleWidget;
  late final Widget? mediaContentWidget;
  late final Widget? mediaActionsWidget;
  final Widget? expand;
  late final Size truthSize;
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
    final width = widget.truthSize.width;
    final height = widget.truthSize.height;
    final isRound = widget.round;
    final direction = widget.direction;
    final mediaContentWidget = widget.mediaContentWidget;
    final mediaImageWidget = widget.mediaImageWidget;
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

    final borderRadius =
        isRound ? BorderRadius.circular(16.0) : BorderRadius.circular(0.0);
    final decoration = BoxDecoration(
        color: Colors.white,
        boxShadow: shadow,
        borderRadius: borderRadius,
        border: isOutline ? Border.all(color: Grey.grey_3, width: 2.0) : null);

    final guessedContent = Builder(builder: (context) {
      if (child != null) {
        return child;
      }

      final _mc = Flex(
        direction: direction,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [mediaImageWidget, mediaContentWidget]
            .where((el) => el != null)
            .toList() as List<Widget>,
      );

      return ClipRRect(borderRadius: borderRadius, child: _mc);
    });

    return Container(
        width: width,
        height: height,
        decoration: decoration,
        child: guessedContent);
  }
}
