import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/shard/color.dart';

class CardSalahTime extends StatelessWidget {
   CardSalahTime({super.key, this.salahName,this.salahTime});
  String? salahName;
  String ?salahTime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 133.h,
      child: Stack(
        children: [
          SizedBox(child: Image.asset("assets/Rectangle 141.png",fit: BoxFit.fill,)),
          Positioned(
            top: 20.h,
            right: 40.w,
            left: 35.w,
            child: SizedBox(
              height: 31.h,
              width: double.infinity,
              child: Text(
                salahName??" ",
                style: TextStyle(
                  color: white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

           Positioned(
           top: 50.h,
            right: 40,
            left: 35,
            child: SizedBox(
              height: 31.h,
              width: double.infinity,
              child: Text(
                salahTime??"",
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 40,
            child: Text("PM",style: TextStyle(color: white,fontSize: 20.sp),)),

        ],
      ),
    );
  }
}
