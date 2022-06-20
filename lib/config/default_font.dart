import 'package:flutter/widgets.dart';
import 'package:plume_ui/config/default_color.dart';

class FontSize {
  static const mini = 12.0;
  static const small = 14.0;
  static const normal = 16.0;
  static const large = 18.0;
}

class FontStyle {
  static const h1 = TextStyle(
      fontSize: 20.0, color: TextColor.h1, fontWeight: FontWeight.w600);
  static const h2 = TextStyle(
      fontSize: 18.0, color: TextColor.h2, fontWeight: FontWeight.w600);
  static const h3 = TextStyle(
      fontSize: 16.0, color: TextColor.h3, fontWeight: FontWeight.w600);
  static const h4 = TextStyle(
      fontSize: 14.0, color: TextColor.h4, fontWeight: FontWeight.w600);
  static const h5 = TextStyle(
      fontSize: 12.0, color: TextColor.h5, fontWeight: FontWeight.w600);
  static const text =
      TextStyle(fontSize: FontSize.small, color: TextColor.text);
}
