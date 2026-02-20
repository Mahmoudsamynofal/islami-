import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/quran/services/most_recintly_services.dart';
import 'package:islami/shard/color.dart';

class SuraDetails extends StatefulWidget {
   SuraDetails({super.key, required this.index,required this.suraName});
  final int index;
  String suraName;

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late String suraDat=" ";
  Future<String> readFile() async {
    suraDat = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/files/Suras/${widget.index}.txt");
    setState(() {});
    return suraDat;
  }
 
  

  @override
  void initState() {
    readFile();
    super.initState();
     RecentSurahsService.addRecentSurah(widget.index-1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text( widget.suraName, style: TextStyle(color: gold)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/Group 38.png"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Expanded(
              child: SingleChildScrollView(
                child: Text(
                  suraDat,
                  style: TextStyle(fontSize: 20.sp, color: gold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
