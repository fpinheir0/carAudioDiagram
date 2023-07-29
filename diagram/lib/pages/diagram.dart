// import 'package:diagram/utils/fab_menu_button.dart';
import 'package:diagram/utils/fab_menu_button.dart';
import 'package:flutter/material.dart';

class DiagramPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabMenuButton(),
      body: Image.asset(
        "assets/images/car.png",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
