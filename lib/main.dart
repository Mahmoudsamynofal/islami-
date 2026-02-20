import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/splah/splash_main.dart';
import 'package:islami/services/onbording_services.dart';
import 'package:islami/shard/color.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await OnbordingServices.initializeshared();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: true,

      child: ScreenUtilInit(
        designSize: const Size(433, 932),
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Janna",
            appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: gold)),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashMain(),
        ),
      ),
    );
  }
}
