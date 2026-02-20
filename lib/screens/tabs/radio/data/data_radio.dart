import 'package:dio/dio.dart';

class DataRadio {
  Dio dio = Dio();

  Future<List<Map<String, dynamic>>> getRadio() async {
    try {
      Response response = await dio.get(
        "https://www.mp3quran.net/api/v3/radios?language=eng",
      );

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data["radios"]);
      } else {
        throw Exception('فشل تحميل البيانات: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ في الاتصال بالإنترنت');
    }
  }

  Future<List<Map<String, dynamic>>> getReciters() async {
    try {
      var response = await dio.get("https://www.mp3quran.net/api/v3/reciters?language=ar");
        if(response.statusCode == 200){
          return  List<Map<String, dynamic>>.from(response.data["reciters"]);
        } else {
        throw Exception('فشل تحميل البيانات: ${response.statusCode}');
      }
    }on DioException catch (e) {
     if(e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout){
        throw Exception('خطأ في الاتصال بالإنترنت: وقت الاتصال انتهى');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('فشل تحميل البيانات: ${e.response?.statusCode}');
      } else {
        throw Exception('خطأ في الاتصال بالإنترنت');
      }
    }
  }
}


























// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class DataRadio {
//   // استبدل بالـ API endpoint الحقيقي
//   final String apiUrl = "http://api.mp3quran.net/api_2/reads?language=en";
  
//   Future<List<Map<String, dynamic>>> getRadio() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
      
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
        
//         // تعديل حسب structure الـ API بتاعك
//         // الكود ده مثال، ممكن يحتاج تعديل حسب response الـ API
        
//         if (data is Map && data.containsKey('radios')) {
//           // لو الـ response شكله: {"radios": [...]}
//           return List<Map<String, dynamic>>.from(data['radios']);
//         } else if (data is List) {
//           // لو الـ response مباشرة array: [...]
//           return List<Map<String, dynamic>>.from(data);
//         } else {
//           return [];
//         }
//       } else {
//         throw Exception('فشل تحميل البيانات: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('خطأ في جلب البيانات: $e');
//       throw Exception('خطأ في الاتصال بالإنترنت');
//     }
//   }
// }
