import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/screens/tabs/timer/data/data_timer.dart';
import 'package:islami/screens/tabs/timer/widget/card_splah_time.dart';
import 'package:islami/shard/color.dart';

class CostumeCarousel extends StatelessWidget {
  const CostumeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>>(
      future: DataTimer().gettimer(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              child: Text("waiting", style: TextStyle(color: black)),
            ),
          );
        } else if (snapshot.hasData) {
          return SizedBox(
            width: 399,
            height: 133,
            child: StatefulBuilder(
              builder: (context, setState) => CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  return CardSalahTime(
                    salahName: snapshot.data["timings"].keys.toList()[index],
                    salahTime: snapshot.data["timings"].values.toList()[index],
                  );
                },
                options: CarouselOptions(
                 
                  enlargeCenterPage: true,
                  pauseAutoPlayOnTouch: false,

                  viewportFraction: 0.32,
                  enlargeFactor: .1,
                  // onPageChanged: (index, reason) {
                  //   setState(() {});
                  //   ActiveIndex = index;
                  // },

                  // reverse: false,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("hello world"));
        } else {
          return Container();
        }
      },
    );
  }
}
