import 'package:flutter/material.dart';
import 'package:plume_ui/config/default_color.dart';

noop() {}

colorDeeper(Color color) {
  return Color(color.value - 0x40404040);
}

Color lignter(Color color) {
  return Color(color.value + 0x60000000);
}

Color chooseFontColorFromColor(Color color, {int divide = 1}) {
  if (color.computeLuminance() > 0.6) {
    switch (divide) {
      case 1:
        return Grey.grey_7;
      case 2:
        return Grey.grey_6;
      case 3:
        return Grey.grey_5;
    }
    return Grey.grey_4;
  }
  switch (divide) {
    case 1:
      return Grey.grey_1;
    case 2:
      return Grey.grey_2;
    case 3:
      return Grey.grey_3;
  }
  return Grey.grey_4;
}
