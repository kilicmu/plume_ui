import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button_demo.dart';
import 'package:plume_ui/routes/home.dart';

final routes = {
  "/": (BuildContext context) => const Home(),
  "/button": (BuildContext context) => const PlButtonDemo(),
};
