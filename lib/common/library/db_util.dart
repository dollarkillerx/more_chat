import 'package:hive_flutter/hive_flutter.dart';

/// Hive 数据操作
class DBUtil {
  static final DBUtil _singleton = DBUtil._internal();

  factory DBUtil() {
    return _singleton;
  }

  DBUtil._internal();

  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('myBox');
  }

  Box get box => _box;
}