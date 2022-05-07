import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button_demo.dart';
import 'package:plume_ui/components/cell/cell_demo.dart';
import 'package:plume_ui/routes/home.dart';

final routes = {
  "/button": (BuildContext context) => const PlButtonDemo(),
  "/cell": (BuildContext context) => const PlCellDemo(),
  "/": (BuildContext context) => const Home(),
};
