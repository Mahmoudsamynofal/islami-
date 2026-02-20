import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:islami/screens/onbording/onbording_screen.dart';
import 'package:islami/screens/tabs/botom_nav_bar.dart';
import 'package:islami/services/onbording_services.dart';

class SplashMain extends StatefulWidget {
  const SplashMain({super.key});

  @override
  State<SplashMain> createState() => _SplashMainState();
}

class _SplashMainState extends State<SplashMain> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirstTime = OnbordingServices.isFristTime();
     OnbordingServices.setFristTime();
    if (isFirstTime == false) {

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => BotomNavBar()));
     
    }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      backgroundColor: Color(0xff202020),

      gifPath: 'assets/icon_splah.png',
      gifWidth: double.infinity,
      gifHeight: double.infinity,
      nextScreen: OnBoardingScreen(),
      duration: const Duration(milliseconds: 3515),
      useImmersiveMode: true,
    );
  }
}
