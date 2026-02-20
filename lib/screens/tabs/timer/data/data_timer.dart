import 'dart:developer';

import 'package:dio/dio.dart';

class DataTimer {
  Dio dio = Dio();
  Future<Map<String, dynamic>> gettimer() async {
    try {
      var response = await dio.get(
        "https://api.aladhan.com/v1/timingsByCity/12-02-2026?city=cairo&country=egypt&method=8",
      );
      if (response.statusCode==200) {
 
      return response.data["data"];
      }else
      {
       throw Exception('فشل تحميل البيانات: ${response.statusCode}');
      }
     
    }
    catch  (e) {
      log(e.toString());
      throw Exception('خطأ في الاتصال بالإنترنت');
    }
  }
}
