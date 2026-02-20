import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/timer/widget/Azkar_timer.dart';
import 'package:islami/screens/tabs/timer/widget/header_timer.dart';
import 'package:islami/shard/color.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          SizedBox(width: 299.w, child: Image.asset("assets/img_header.png")),
          SizedBox(height: 10),
          Expanded(child: HeaderTimer()),
         
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Azkar",
                style: TextStyle(fontSize: 16.sp, color: white),
              ),
            ),
          ),
         
          AzkarTimer(),
        ],
      ),
    );
  }
}




