import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/quran/data/quran_model.dart';
import 'package:islami/screens/tabs/quran/services/most_recintly_services.dart';
import 'package:islami/screens/tabs/quran/sura_details.dart';
import 'package:islami/shard/color.dart';

class ItemMostResently extends StatefulWidget {
  const ItemMostResently({super.key});

  @override
  State<ItemMostResently> createState() => _ItemMostResentlyState();
}

class _ItemMostResentlyState extends State<ItemMostResently> {
  List<int> recentSurahs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRecentSurahs();
  }

  Future<void> loadRecentSurahs() async {
    List<int> recent = await RecentSurahsService.getRecentSurahs();
    setState(() {
      recentSurahs = recent;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Most Recently",
            style: TextStyle(
              color: white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),

        if (isLoading)
          Center(child: CircularProgressIndicator(color: gold))
        else if (recentSurahs.isEmpty)
          Center(
            child: Text(
              "لم تقرأ أي سورة بعد",
              style: TextStyle(color: white, fontSize: 14),
            ),
          )
        else
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentSurahs.length,
              itemBuilder: (BuildContext context, int index) {
                int surahIndex = recentSurahs[index];
                SurahModel surah = SuraName.surahs[surahIndex];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SuraDetails(index: surahIndex + 1, suraName: surah.nameAR)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 283,
                    height: 120,
                    decoration: BoxDecoration(
                      color: gold,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                surah.nameEN,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                surah.nameAR,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${surah.ayatCount} Verses",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Image(
                            image: AssetImage(
                              "assets/background/img_most_recent.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
