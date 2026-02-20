import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/quran/data/quran_model.dart';
import 'package:islami/screens/tabs/quran/services/most_recintly_services.dart';
import 'package:islami/screens/tabs/quran/sura_details.dart';
import 'package:islami/shard/color.dart';

class SuraItem extends StatefulWidget {
  const SuraItem({super.key});

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 114,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()async {
              await RecentSurahsService.addRecentSurah(index + 1);
             
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuraDetails(index: index + 1, suraName: SuraName.surahs[index].nameEN,),
                ),
              );
            },
            child: ListTile(
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/icon/img_sur_number_frame.png"),
                  ),
                  Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              title: Text(
                SuraName.surahs[index].nameEN,
                style: TextStyle(
                  color: white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                SuraName.surahs[index].ayatCount.toString(),
                style: TextStyle(color: white, fontSize: 14.sp),
              ),
              trailing: Text(
                SuraName.surahs[index].nameAR,
                style: TextStyle(
                  color: white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(indent: 40.sp, endIndent: 40.sp, color: grey);
        },
      ),
    );
  }
}
