// ignore: camel_case_types
import 'dart:convert';
import 'package:cbithackathon/apiservices/api_service.dart';
import 'package:cbithackathon/models/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  UserDetails user = UserDetails();
  UserDetails get userDetails {
    return user;
  }

  Future<void> getUserDetails() async {
    String url = "${ApiConfig.host}auth/users/me/";
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'JWT $obtainedToken',
      });
      // ignore: avoid_print
      print(response.body);
      // ignore: avoid_print
      print(response.statusCode);

      final responseData = json.decode(response.body);
      // ignore: non_constant_identifier_names
      UserDetails repo = UserDetails(firstName: responseData['first_name']);
      // print(responseData);
      user = repo;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
