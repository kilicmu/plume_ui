import 'package:flutter/material.dart';

noop() {}

colorDeeper(Color color) {
  return Color(color.value - 0x40404040);
}

Color lignter(Color color) {
  return Color(color.value + 0x60000000);
}
