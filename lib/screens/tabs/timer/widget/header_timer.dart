import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/import_screen.dart';
import 'package:islami/screens/tabs/timer/data/data_timer.dart';
import 'package:islami/screens/tabs/timer/widget/coustom_carousel.dart';
import 'package:islami/shard/color.dart';

class HeaderTimer extends StatefulWidget {
  const HeaderTimer({super.key});

  @override
  State<HeaderTimer> createState() => _HeaderTimerState();
}

class _HeaderTimerState extends State<HeaderTimer> {
  var ActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataTimer().gettimer(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: gold));
        } else if (snapshot.hasError || snapshot.data == null) {
          return Column(children: [
                  Icon(Icons.wifi_off,size: 50,color: gold,),
                  SizedBox(height: 10,),
                  Text("لا يوجد اتصال ب الانترنت",style: TextStyle(fontSize: 20.sp,color: white),),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      
                    });
                  }, child: Text("اعاده المحاوله"))
              ],
             );
        }else if(snapshot.hasData)
        {
          return  Stack(
          children: [
            Container(
              width: 390.w,
              height: 301.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: Color(0xff856B3F),
              ),
            ),
            Positioned(
              child: SizedBox(
                width: 390.w,
                height: 301.h,
                child: Image.asset("assets/Group 35 (1).png", fit: BoxFit.fill),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50.h,
                  width: 61.w,
                  child: Text(
                    snapshot.data["date"]["readable"],
                    style: TextStyle(fontSize: 16.sp, color: white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  width: 61,
                  child: Text(
                    snapshot.data["date"]["hijri"]["month"]["ar"],
                    style: TextStyle(fontSize: 12.sp, color: white),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 130,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Pray Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Color(0xff202020),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 30,
              right: 140,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Tuesday",
                  style: TextStyle(fontSize: 20.sp, color: Color(0xff202020)),
                ),
              ),
            ),
            Positioned(bottom: 35.h, child: CostumeCarousel()),
          ],
        );
        }else {
          return Center(child: Text("حدث خطأ ما", style: TextStyle(color: gold, fontSize: 20.sp),));
        }

       
      },
    );
  }
}
