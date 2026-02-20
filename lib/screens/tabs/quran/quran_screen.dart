import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/quran/searsh_result.dart';
import 'package:islami/screens/tabs/quran/widget_quran/item_most_resently.dart';
import 'package:islami/screens/tabs/quran/widget_quran/sura_item.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h),
            SizedBox(
              width: 299.w,
              height: 141.h,
              child: Image(image: AssetImage("assets/img_header.png")),
            ),
            SizedBox(height: 15.h),

            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>SearshResult())),
              child: Container(
                height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xffE2BE7F), width: 3.w),
                ),
                child: ListTile(
                  leading: Image.asset(
                    "assets/icon/Vector (2).png",
                    color: Color(0xffE2BE7F),
                  ),
                  title: Text("Sura Name", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

       
            SizedBox(height: 10.sp),
            Align(alignment: Alignment.topLeft, child: ItemMostResently()),
            SizedBox(height: 10.sp),
            Align(
              alignment: Alignment.topLeft,

              child: Text(
                "Sura List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(child: SuraItem()),
          ],
        ),
      ),
    );
  }
}
