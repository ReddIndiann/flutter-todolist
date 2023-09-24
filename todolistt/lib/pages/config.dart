import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_models.dart';

class LocalDB {
  static void init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>('userBox');
  }

  static Box<UserModel> get userBox => Hive.box('userbox');
}
