import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/shard/color.dart';

// ignore: must_be_immutable
class HadtithDetails extends StatefulWidget {
  HadtithDetails({super.key, required this.index});
  int index;
  @override
  State<HadtithDetails> createState() => _HadtithDetailsState();
}

class _HadtithDetailsState extends State<HadtithDetails> {
  // late String hadith;
  //  @override
  // void initState() {
  //   super.initState();
  //   readFile();
  // }

  Future<String> readFile() async {
    var assetBundle = DefaultAssetBundle.of(context);
    String hadith = await assetBundle.loadString("assets/files/Hadeeth/h${widget.index}.txt");
    // setState(() {});
    return hadith;
  }

 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: readFile(), builder: ( context,  snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: gold));
      } else if (snapshot.hasError) {
        return Center(
          child: Text(
            "${snapshot.error}",
            style: TextStyle(color: Colors.red),
          ),
        );
      } else {
        return  snapshot.data == null ? Center(child: Text("لا يوجد حديث", style: TextStyle(color: gold, fontSize: 20.sp),)) :
         Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${widget.index.toString()} الحديث", style: TextStyle(color: gold)),
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
                  snapshot.data ?? "",
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
    });
    
  }
}
