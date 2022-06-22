import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plume_ui/common/utils.dart';
import 'package:plume_ui/config/default_color.dart';
import 'package:plume_ui/config/default_font.dart';

enum CrButtonType {
  normal,
  primary,
  success,
  warning,
  danger,
}

enum CrButtonSize {
  mini,
  small,
  normal,
  large,
  cell,
}

final Map<CrButtonType, Color> plButtonType2ColorRecord = {
  CrButtonType.normal: Colors.white,
  CrButtonType.primary: Primary.primary_5,
  CrButtonType.success: Success.success_5,
  CrButtonType.warning: Warning.warn_5,
  CrButtonType.danger: Error.error_5,
};

final Map<CrButtonType, Color> plButtonType2BorderColorRecord = {
  CrButtonType.normal: Grey.grey_5,
  CrButtonType.primary: Primary.primary_6,
  CrButtonType.success: Success.success_6,
  CrButtonType.warning: Warning.warn_6,
  CrButtonType.danger: Error.error_6,
};

final Map<CrButtonSize, Size> plButtonSize2DartSizeRecord = {
  CrButtonSize.mini: const Size(52.0, 26.0),
  CrButtonSize.small: const Size(68.0, 34.0),
  CrButtonSize.normal: const Size(84.0, 42.0),
  CrButtonSize.large: const Size(100.0, 50.0),
  CrButtonSize.cell: const Size(double.infinity, 50.0),
};

final Map<CrButtonSize, double> plButtonSize2FontSizeRecord = {
  CrButtonSize.mini: FontSize.mini,
  CrButtonSize.small: FontSize.small,
  CrButtonSize.normal: FontSize.normal,
  CrButtonSize.large: FontSize.large,
  CrButtonSize.cell: FontSize.large,
};

class CrButton extends StatefulWidget {
  CrButton({
    Key? key,
    this.type = CrButtonType.normal,
    this.size = CrButtonSize.normal,
    this.plain = false,
    this.loading = false,
    this.disabled = false,
    this.onlyText = false,
    this.round = false,
    this.text,
    this.child,
    this.icon,
    this.rightIcon,
    this.onTap = noop,
  }) {
    if (icon != null || rightIcon != null) {
      if (icon != null && rightIcon != null) {
        assert(true);
      }
    }
    if (text != null || child != null) {
      if (text != null && child != null) {
        assert(true);
      }
    }

    if (plain && type == CrButtonType.normal) {
      assert(true);
    }
  }

  final CrButtonType type;
  final CrButtonSize size;
  final bool plain;
  final bool disabled;
  final String? text;
  final bool onlyText;
  final Widget? child;
  final IconData? icon;
  final IconData? rightIcon;
  final bool loading;
  final bool round;
  bool $$roundLeftTop = false;
  bool $$roundRightTop = false;
  bool $$roundLeftBottom = false;
  bool $$roundRightBottom = false;
  final Function() onTap;

  @override
  State<CrButton> createState() => _CrButtonState();
}

class _CrButtonState extends State<CrButton>
    with SingleTickerProviderStateMixin {
  late AnimationController waveController;
  late Animation<double> waveAnimation;
  final waveEffect = 3.0;
  bool isPressing = false;

  @override
  void initState() {
    super.initState();
    waveController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    waveAnimation = Tween(begin: 0.0, end: waveEffect).animate(waveController)
      ..addListener(() {
        setState(() {
          if (waveAnimation.value == waveEffect) {
            waveController.reset();
          }
        });
      });
  }

  @override
  void dispose() {
    waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final type = widget.type;
    final plain = widget.plain;
    final disabled = widget.disabled || widget.loading;
    final icon = widget.icon;
    final rightIcon = widget.rightIcon;
    final text = widget.text;
    final child = widget.child;
    final loading = widget.loading;
    final onTap = widget.onTap;
    final round = widget.round;
    final onlyText = widget.onlyText;

    var s = plButtonSize2DartSizeRecord[size] ??
        plButtonSize2DartSizeRecord[CrButtonSize.normal]!;
    if (round && text == null && child == null) {
      s = Size.square(s.height);
    }
    final c = (() {
      var color = Colors.transparent;
      if (!onlyText) {
        color = plButtonType2ColorRecord[type] ??
            plButtonType2ColorRecord[CrButtonType.normal]!;
      }
      if (disabled) {
        color = lignter(color);
      }
      return color;
    })();
    final fontSize = plButtonSize2FontSizeRecord[size] ??
        plButtonSize2FontSizeRecord[CrButtonSize.normal];

    final bc = (() {
      var color = !onlyText
          ? plButtonType2BorderColorRecord[type] ??
              plButtonType2BorderColorRecord[CrButtonType.normal]!
          : Colors.transparent;
      if (disabled) {
        color = lignter(color);
      }
      return color;
    })();

    final textColor = (() {
      if (onlyText) {
        var color = Colors.transparent;
        if (type == CrButtonType.normal) {
          color = Grey.grey_7;
        } else {
          color = plButtonType2ColorRecord[type] ?? Grey.grey_7;
        }
        if (disabled) {
          color = lignter(color);
        }
        return color;
      }

      if (plain) {
        var color = Colors.transparent;
        if (type == CrButtonType.normal) {
          color = Grey.grey_7;
        } else {
          color = plButtonType2ColorRecord[type] ??
              plButtonType2ColorRecord[CrButtonType.normal]!;
        }
        if (disabled) {
          color = lignter(color);
        }
        return color;
      }
      if (c.computeLuminance() < 0.6) {
        return Grey.grey_1;
      }
      return Grey.grey_7;
    })();

    final border = Border.all(
      color: bc,
      width: 1,
    );

    BoxConstraints constraints = () {
      if (size == CrButtonSize.cell) {
        return const BoxConstraints(minWidth: double.infinity);
      }
      if (text != null) {
        if (!onlyText) {
          return BoxConstraints(minWidth: s.width, maxHeight: s.height);
        }
        return const BoxConstraints();
      }
      return BoxConstraints.tight(s);
    }();

    final List<BoxShadow> boxShadow = [];
    if (waveAnimation.value > 0 && !onlyText) {
      boxShadow.add(BoxShadow(
          color: bc.withOpacity(1 / (waveAnimation.value + 1)),
          spreadRadius: waveAnimation.value,
          blurRadius: waveAnimation.value,
          blurStyle: BlurStyle.outer));
    }

    BorderRadius? borderRadius;
    if (round) {
      borderRadius = BorderRadius.circular(s.height / 2);
    } else {
      final radius = Radius.circular(s.height / 2);
      bool topLeft = widget.$$roundLeftTop;
      bool topRight = widget.$$roundRightTop;
      bool bottomLeft = widget.$$roundLeftBottom;
      bool bottomRight = widget.$$roundRightBottom;

      borderRadius = BorderRadius.only(
          topLeft: topLeft ? radius : Radius.zero,
          topRight: topRight ? radius : Radius.zero,
          bottomLeft: bottomLeft ? radius : Radius.zero,
          bottomRight: bottomRight ? radius : Radius.zero);
    }

    final decoration = plain
        ? BoxDecoration(boxShadow: boxShadow, borderRadius: borderRadius)
        : BoxDecoration(
            color: c, boxShadow: boxShadow, borderRadius: borderRadius);
    Decoration? fDecoration =
        BoxDecoration(border: border, borderRadius: borderRadius);
    if (isPressing) {
      fDecoration = BoxDecoration(
          color: Grey.grey_1.withOpacity(0.2),
          border: border,
          borderRadius: borderRadius);
    }

    final truthyDisabled = disabled || loading;

    final textStyle = TextStyle(
        color: textColor,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        textBaseline: TextBaseline.ideographic);

    final children = <Widget>[];

    if (loading || icon != null) {
      var iconData = icon;
      if (loading) {
        children.add(
            SpinKitRing(size: s.height / 2.5, color: lignter(c), lineWidth: 2));
      } else {
        children.add(Icon(iconData, size: fontSize, color: textColor));
      }
    }

    if (text != null) {
      children.add(Text(
        text,
        style: textStyle,
      ));
    }

    if (text == null && child != null) {
      children.add(child);
    }

    if (rightIcon != null) {
      children.add(Icon(rightIcon, size: fontSize, color: textColor));
    }

    if (children.length >= 2) {
      children.insert(
          1, Padding(padding: EdgeInsets.only(left: s.height / 10)));
    }

    // ignore: prefer_function_declarations_over_variables
    final tapDownFn = (TapDownDetails detail) {
      if (truthyDisabled) return;
      setState(() {
        isPressing = true;
      });
    };

    // ignore: prefer_function_declarations_over_variables
    final tapUpFn = (TapUpDetails? detail) {
      if (truthyDisabled) return;
      setState(() {
        isPressing = false;
      });
      // ignore: unnecessary_null_comparison
      if (waveController != null) {
        waveController.forward();
      }
      onTap();
    };
    return GestureDetector(
      onTapDown: tapDownFn,
      onTapCancel: () => {tapUpFn(null)},
      onTapUp: tapUpFn,
      child: Container(
          height: s.height,
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          constraints: constraints,
          decoration: decoration,
          foregroundDecoration: fDecoration,
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            direction: Axis.horizontal,
            children: [Row(children: children)],
          )),
    );
  }
}
