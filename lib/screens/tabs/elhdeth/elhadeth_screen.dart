import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/elhdeth/widget_hadith/item_hadith.dart';

class ElhadethScreen extends StatefulWidget {
  const ElhadethScreen({super.key});

  @override
  State<ElhadethScreen> createState() => _ElhadethScreenState();
}

class _ElhadethScreenState extends State<ElhadethScreen> {
  // ignore: non_constant_identifier_names
  // int ActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 299.w,
          height: 141.h,
          child: Image(image: AssetImage("assets/img_header.png")),
        ),
        SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: 50,
          itemBuilder: (context, index, realIndex) {
            return ItemHadith(index: index + 1);
          },
          options: CarouselOptions(
            height: 625.h,
        
            enlargeCenterPage: true,
            pauseAutoPlayOnTouch: false,
        
            viewportFraction: 0.60,
            enlargeFactor: .2,
            // onPageChanged: (index, reason) {
            //   setState(() {});
            //   ActiveIndex = index;
            // },
        
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}







          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     SizedBox(
          //       height: 618.h,
          //       width: 313.w,
          //       child: Image(image: AssetImage("assets/hadeth_card_bc.png")),
          //     ),
          //     Positioned(
          //       top: 49.h,
          //       child: Text(
          //         "الحد يث الأول",
          //         style: TextStyle(fontSize: 20.sp, color: black),
          //       ),
          //     ),
          //   ],
          // ),
          //  Container(
          //   width: 313.3.w,
          //   height: 618.h,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20.r),
          //     color: gold
          //   ),
          //  )
