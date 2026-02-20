import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/timer/widget/card_azkar_timer.dart';
import 'package:flutter/material.dart';

class AzkarTimer extends StatelessWidget {
  const AzkarTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CardAzkarTimer(imageUrl: 'assets/icon/bell-icon 1 (1).png', text: 'Evening Azkar', index:1 , ),
                  SizedBox(width: 10.w),
                  CardAzkarTimer(imageUrl: 'assets/icon/comment-bubble-icon 1.png', text: 'Morning Azkar', index: 2,),
                ],
                
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CardAzkarTimer(imageUrl: 'assets/icon/document-icon 1 (1).png', text: 'Waking Azkar', index: 3,),
                  SizedBox(width: 10.w),
                  CardAzkarTimer(imageUrl: 'assets/icon/document-icon 1.png', text: 'Sleeping Azkar', index: 4,),
                ],
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}