import 'package:shared_preferences/shared_preferences.dart';

class RecentSurahsService {
  static const String _key = 'recent_surahs';
  static const int _maxRecentItems = 5;

  // حفظ السورة في القائمة
  static Future<void> addRecentSurah(int surahIndex) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentList = prefs.getStringList(_key) ?? [];

    // إزالة السورة لو موجودة قبل كده (عشان نحطها في الأول)
    recentList.remove(surahIndex.toString());

    // إضافة السورة في أول القائمة
    recentList.insert(0, surahIndex.toString());

    // الاحتفاظ بآخر 5 سور بس
    if (recentList.length > _maxRecentItems) {
      recentList = recentList.sublist(0, _maxRecentItems);
    }

    await prefs.setStringList(_key, recentList);
  }

  // جلب آخر 5 سور
  static Future<List<int>> getRecentSurahs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recentList = prefs.getStringList(_key) ?? [];
    return recentList.map((e) => int.parse(e)).toList();
  }

  // مسح القائمة (اختياري)
  static Future<void> clearRecentSurahs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}