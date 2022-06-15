import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button_demo.dart';
import 'package:plume_ui/components/card/card_demo.dart';
import 'package:plume_ui/components/cell/cell_demo.dart';
import 'package:plume_ui/routes/home.dart';

final routes = {
  "/button": (BuildContext context) => const CrButtonDemo(),
  "/cell": (BuildContext context) => const CrCellDemo(),
  "/card": (BuildContext context) => const CrCardDemo(),
  "/": (BuildContext context) => const Home(),
};
