import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/user.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    name: 'sandesh',
    email: 'sandesh@gmail.com',
    imageUrl:
        'https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
