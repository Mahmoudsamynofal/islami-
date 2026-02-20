import 'package:flutter/material.dart';

class SplahScreen extends StatelessWidget {
  const SplahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/Splash Screen.png"), fit: BoxFit.fill),
          ),
        );
  }
}