import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/import_screen.dart';
import 'package:islami/screens/tabs/radio/data/data_radio.dart';
import 'package:islami/screens/tabs/radio/widget/radio_card.dart';
import 'package:islami/shard/color.dart';

class RadioContent extends StatelessWidget {
  const RadioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DataRadio().getRadio(),

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(
            color: gold,
          ));
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
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return RadioCard(
                title: data[index]["name"] ?? "قارئ",
                audioUrl: data[index]["url"] ?? "",
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
