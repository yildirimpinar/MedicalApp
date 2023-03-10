import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:teletip_app/main.dart';
import 'package:teletip_app/models/user_login_res.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    return isKeyExist;
  }

  static Future<UserLoginRes?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    if (isKeyExist) {
      var cachedData = await APICacheManager().getCacheData('login_details');
      return userLoginResJson(cachedData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(UserLoginRes model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: 'login_details', syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache('login_details');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
        (route) => false);
  }
}
