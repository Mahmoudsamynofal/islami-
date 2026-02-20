import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/radio/widget/radio_content.dart';
import 'package:islami/screens/tabs/radio/widget/resiters_content.dart';
import 'package:islami/shard/color.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  

  @override
  
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // الصورة اللي فوق
          SizedBox(
            width: 291,
            height: 171,
            child: Image.asset("assets/img_header.png"),
          ),
          SizedBox(height: 10),

          // الـ Tabs
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Color(0xFFE2BE7F),
                borderRadius: BorderRadius.circular(12.r),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              unselectedLabelColor: gold,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(text: "Radio"),
                Tab(text: "Reciters"),
              ],
            ),
          ),

          // محتوى الـ Tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // محتوى Radio
                RadioContent(),

                // محتوى Hadeths
                ResitersContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

