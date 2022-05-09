import 'package:flutter/material.dart';
import 'package:plume_ui/components/button/button.dart';
import 'package:plume_ui/routes/components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("plume ui")),
      body: SingleChildScrollView(
          child: Column(
              children: components
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CrButton(
                          size: CrButtonSize.cell,
                          text: e.name,
                          onTap: () => Navigator.of(context)
                              .pushNamed(e.path, arguments: e.name))))
                  .toList())),
    );
  }
}
