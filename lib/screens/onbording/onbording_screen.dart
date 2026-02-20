import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/screens/onbording/onbording_data.dart';
import 'package:islami/screens/onbording/onbording_page.dart';
import 'package:islami/screens/tabs/botom_nav_bar.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: IntroductionScreen(
        globalBackgroundColor: const Color(0xff202020),
        pages: onboardingItems.map(buildOnBoardingPage).toList(),
        showBackButton: true,
        back: Text("Back", style: TextStyle(fontSize: 15, color: Color(0xffFFD482))),
        next: Text("Next", style: TextStyle(fontSize: 15, color: Color(0xffFFD482))),
        done: Text(
          "Start",
          style: TextStyle(fontSize: 18, color: Color(0xffFFD482)),
        ),
        dotsDecorator: const DotsDecorator(
          activeColor: Color(0xffFFD482),
          color: Colors.grey,
          size: Size(6, 6),
          activeSize: Size(18, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BotomNavBar()),
          );
        },
      ),
    );
  }
}
