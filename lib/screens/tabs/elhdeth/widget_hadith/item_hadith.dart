import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/import_screen.dart';
import 'package:islami/screens/tabs/elhdeth/hadtith_details.dart';
import 'package:islami/shard/color.dart';

// ignore: must_be_immutable
class ItemHadith extends StatefulWidget {
  ItemHadith({super.key, required this.index});
  int index;

  @override
  State<ItemHadith> createState() => _ItemHadithState();
}

class _ItemHadithState extends State<ItemHadith> {
  late String hadith=" ";
  Future<String> readFile() async {
    hadith = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/files/Hadeeth/h${widget.index}.txt");
    setState(() {});
    return hadith;
  }

  @override
  void initState() {
    readFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return hadith.isEmpty?Center(child: CircularProgressIndicator(color: gold,)):
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HadtithDetails(index: widget.index),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 618.h,
            width: 313.w,
            child: Image(image: AssetImage("assets/hadeth_card_bc.png")),
          ),

          Positioned(
            top: 100.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              width: 300.w,
              height: 450.h,
              child: Text(
                hadith,
                style: TextStyle(fontSize: 16.sp, color: black),
                
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}






 // Positioned(
          //   top: 49.h,
          //   child: Text(
          //     "الحديث1",
          //     style: TextStyle(fontSize: 20.sp, color: black),
          //   ),
          // ),