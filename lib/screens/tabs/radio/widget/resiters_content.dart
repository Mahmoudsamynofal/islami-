import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/tabs/radio/data/data_radio.dart';
import 'package:islami/screens/tabs/radio/widget/radio_card.dart';
import 'package:islami/shard/color.dart';

class ResitersContent extends StatefulWidget {
  const ResitersContent({super.key});

  @override
  State<ResitersContent> createState() => _ResitersContentState();
}

class _ResitersContentState extends State<ResitersContent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DataRadio().getReciters(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
          var data = snapshot.data ?? [];
         
          return ListView.separated(
            itemCount: 114,
            itemBuilder: (BuildContext context, int index) {
             
              return RadioCard(
                
                title: data[index]["name"] ?? "قارئ",
                audioUrl: "${data[index]["moshaf"][0]["server"]}00${index + 1}.mp3" ,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 4.h);
            },
          );
        }
      },
    );
  }
}
