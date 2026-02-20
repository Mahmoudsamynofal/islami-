import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/import_screen.dart';

import 'package:islami/shard/color.dart';

class BotomNavBar extends StatefulWidget {
  const BotomNavBar({super.key});

  @override
  State<BotomNavBar> createState() => _BotomNavBarState();
}

class _BotomNavBarState extends State<BotomNavBar> {
  int index = 0;
  List<Widget> tabScreen = [
    QuranScreen(),
   ElhadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimerScreen(),
  ];
  List<String> images = [
    "assets/background/quran_bg.png",
    "assets/background/hadith_bg.png",
    "assets/background/sebha_bg.png",
    "assets/background/radio_bg.png",
    "assets/background/more_bg.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
        
          // ignore: deprecated_member_use
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
          image: AssetImage(images[index], ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor:transperant,
        body: tabScreen[index],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: gold,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              activeIcon: buildAactiveSelscted("assets/icon/Vector (2).png"),
              icon: Image.asset("assets/icon/Vector (2).png"),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              activeIcon: buildAactiveSelscted(
                "assets/icon/book-album-svgrepo-com 1.png",
              ),
              icon: Image.asset("assets/icon/book-album-svgrepo-com 1.png"),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              activeIcon: buildAactiveSelscted(
                "assets/icon/necklace-islam-svgrepo-com 1.png",
              ),

              icon: Image.asset("assets/icon/necklace-islam-svgrepo-com 1.png"),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              activeIcon: buildAactiveSelscted(
                "assets/icon/radio-svgrepo-com 1.png",
              ),
              icon: Image.asset("assets/icon/radio-svgrepo-com 1.png"),
              label: 'Radio',
            ),

            BottomNavigationBarItem(
              activeIcon: buildAactiveSelscted("assets/icon/Vector (3).png"),

              icon: Image.asset("assets/icon/Vector (3).png"),
              label: 'Time',
            ),
          ],
          onTap: (value) {
            index = value;
            setState(() {});
          },
        ),
      ),
    );
  }

  Container buildAactiveSelscted(String path) {
    return Container(
      width: 60.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: brown,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Image.asset(path, color: white),
    );
  }
}
