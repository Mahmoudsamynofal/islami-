
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/quran/data/quran_model.dart';
import 'package:islami/screens/tabs/quran/services/most_recintly_services.dart';
import 'package:islami/screens/tabs/quran/sura_details.dart';
import 'package:islami/shard/color.dart';

class SearshResult extends StatefulWidget {
  const SearshResult({super.key});

  @override
  State<SearshResult> createState() => _SearshResultState();
}

class _SearshResultState extends State<SearshResult> {
  TextEditingController searchController = TextEditingController();
  List<SurahModel> searshResult = [];
  bool isNotFound = false;
  void searshSurah(String query) {
  setState(() {
    isNotFound = true;
    
    String cleanQuery = query.trim();
    
    if (cleanQuery.isEmpty) {
      searshResult = [];
      isNotFound = false;
    } else {
      searshResult = SuraName.surahs.where((surah) {
        
        String surahNameClean = surah.nameAR.replaceAll('ال', '');
        String queryClean = cleanQuery.replaceAll('ال', '');
        
        return surahNameClean.contains(queryClean) ||
            surah.nameAR.contains(cleanQuery) ||
            surah.nameEN.toLowerCase().contains(cleanQuery.toLowerCase());
      }).toList();
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000).withValues(alpha: 0.45),
      appBar: AppBar(
        title: Text("Search Result", style: TextStyle(color: gold)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) => searshSurah(value),
              controller: searchController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: white),
              cursorColor: Color(0xffE2BE7F),
              decoration: InputDecoration(
                prefixIcon: SizedBox(
                  width: 20.h,
                  height: 20.h,
                  child: Image.asset(
                    "assets/icon/Vector (2).png",
                    color: Color(0xffE2BE7F),
                  ),
                ),
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Sura Name",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(width: 3.w, color: Color(0xffE2BE7F)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Color(0xffE2BE7F)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: isNotFound
                  ? (searshResult.isEmpty
                        ? Center(
                            child: Text(
                              "Not Found",
                              style: TextStyle(color: gold, fontSize: 20.sp),
                            ),
                          )
                        : ListView.builder(
                            itemCount: searshResult.length,
                            itemBuilder: (context, index)  {
                              int surahIndex = SuraName.surahs.indexOf(searshResult[index]);
                            
                              return InkWell(
                                onTap: ()async {
                                    await RecentSurahsService.addRecentSurah(surahIndex + 1);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SuraDetails(index: surahIndex+1
                                  , suraName: searshResult[index].nameAR)));
                                },
                                child: ListTile(
                                  title: Text(
                                    searshResult[index].nameAR,
                                    style: TextStyle(color: white),
                                  ),
                                  subtitle: Text(
                                    searshResult[index].nameEN,
                                    style: TextStyle(color: white),
                                  ),
                                ),
                              );
                            },
                          ))
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
