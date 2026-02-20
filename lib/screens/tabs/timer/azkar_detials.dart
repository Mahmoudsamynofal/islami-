import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/shard/color.dart';

class AzkarDetials extends StatefulWidget {
   AzkarDetials({super.key,required this.index});
  int index;

  @override
  State<AzkarDetials> createState() => _AzkarDetialsState();
}

class _AzkarDetialsState extends State<AzkarDetials> {
  late String azkar;
  Future<String> readFile() async {
    azkar = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/files/Azkar/A${widget.index}.text");
    setState(() {});
    return azkar;
  }

  @override
  void initState() {
    readFile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Azkar", style: TextStyle(color: gold)),
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
                  azkar,
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
