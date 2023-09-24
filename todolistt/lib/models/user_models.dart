import 'package:hive_flutter/hive_flutter.dart';

import '../pages/config.dart';
part "user_models.g.dart";

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String activityname;
  @HiveField(2)
  String starttime;
  @HiveField(3)
  String endtime;
  @HiveField(4)
  String email;
  @HiveField(5)
  String password;

  UserModel({
    required this.id,
    required this.activityname,
    required this.starttime,
    required this.endtime,
    required this.email,
    required this.password,
  });
  void saveUser() {
    {}
    LocalDB.userBox.put(id, this);
  }

  void UpdateUser({
    String? activityname,
    String? starttime,
    String? endtime,
    String? email,
    String? password,
  }) {
    LocalDB.userBox.put(
        id,
        UserModel(
          id: id,
          email: email ?? this.email,
          activityname: activityname ?? this.activityname,
          starttime: starttime ?? this.starttime,
          endtime: endtime ?? this.endtime,
          password: password ?? this.password,
        ));
  }

  void deleteUser() {
    LocalDB.userBox.delete(id);
  }
}
