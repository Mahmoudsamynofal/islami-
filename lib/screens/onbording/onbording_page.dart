import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/screens/onbording/onbording_model.dart';

PageViewModel buildOnBoardingPage(OnBoardingItem item) {
  return  PageViewModel(
    useScrollView: false,
    titleWidget: Image.asset(
      "assets/Group 31.png",
      height: 171,
      width: 291,
      fit: BoxFit.contain,
    ),
    bodyWidget: Column(
      children: [
        SizedBox(
          height: 240,
          width: 250,
          child: Image.asset(item.image, )),
        // SizedBox(height: 20),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffFFD482),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (item.subtitle != null) ...[
          // SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              item.subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffFFD482),
                fontSize: 20,
                height: 1.5,
              ),
            ),
          ),
        ],
      ],
    ),
  );
}