import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/shard/color.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double roatation = 0.0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int index = 0;
  int indexlist = 0;
  void increas() {
    if (index == 33) {
      setState(() {
        roatation += (360 / 33);
      });
      index = 0;

      if (indexlist == 2) {
        indexlist = 0;
      } else {
        indexlist++;
      }
    } else {
      setState(() {
         roatation += (360 / 33);
      });
      index++;
    }
    // setState(() {});
    // index++;
  }

  List<String> azkar = ["سبحان الله", "الحمد الله", "الله اكبر"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: 299.w,
            height: 141.h,
            child: Image.asset("assets/img_header.png"),
          ),
          Spacer(),
          Text(
            "سبح اسم ربك الاعلى",
            style: TextStyle(fontSize: 30, color: white),
          ),

          Spacer(),
          SizedBox(
            height: 86.h,
            width: 379.w,
            child: Image.asset("assets/Group 37.png"),
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 60,
                child: Text(
                  azkar[indexlist],
                  style: TextStyle(fontSize: 30, color: gold),
                ),
              ),
              SizedBox(
                height: 400.h,
                width: 379.w,
                child: Transform.rotate(
                  angle: roatation * 3.14 / 180,
                  child: Image.asset("assets/sebhas.png"),
                ),
              ),
              InkWell(
                onTap: () {
                  increas();
                },
                child: Text(
                  "$index",
                  style: TextStyle(color: white, fontSize: 35),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
