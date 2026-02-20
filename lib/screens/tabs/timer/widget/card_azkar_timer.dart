import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/timer/azkar_detials.dart';
import 'package:islami/shard/color.dart';

class CardAzkarTimer extends StatelessWidget {
  CardAzkarTimer({super.key, required this.imageUrl, required this.text,required this.index});
  String imageUrl;
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AzkarDetials(index: index,)),
          );
        },
        child: Container(
          height: 259.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: gold, width: 2.w),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 184.h,
                width: 184.w,
                child: Image.asset(imageUrl),
              ),
              Text(
                text,
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
