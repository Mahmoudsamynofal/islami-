import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/import_screen.dart';
import 'package:just_audio/just_audio.dart';

class RadioCard extends StatefulWidget {
  final String title;
  final String audioUrl;

  const RadioCard({super.key, required this.title, required this.audioUrl});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool isPlaying = false;

  bool isLoading = false;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.playingStream.listen((Playing) {
      if (mounted) {
        setState(() {
          isPlaying = Playing;
        });
      }
    });
  }

  Future<void> _togeglePlay() async {
    try {
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        audioPlayer.setUrl(widget.audioUrl);
        await audioPlayer.play();
      }
    } catch (e) {
      log("erore$e");
    }
  }
  Future<void> _stop() async {
    try {
      await audioPlayer.stop();
    } catch (e) {
      log("erore$e");
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Stack(
        children:[ Container(
          margin: EdgeInsets.all(5.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            
            color: Color(0xFFE2BE7F),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  IconButton(
                    onPressed: () {
                      _togeglePlay();
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 50.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                         _stop();
                    },
                    icon: Icon(isPlaying? Icons.volume_up : Icons.volume_off, color: Colors.black, size: 30.sp),
                  ),
                 
                ],
              ),
              
            ],
          ),
        ),
        Positioned(
          bottom: 5,
          child: SizedBox(
                    width: 400.w,
                  height: 50.h,
                  child:isPlaying ? Image.asset("assets/Mask group.png",fit: BoxFit.fill,) :Image.asset("assets/Mosque-02.png",fit: BoxFit.fill,),
        )
        )
        ]
      ),
    );
  }
}
