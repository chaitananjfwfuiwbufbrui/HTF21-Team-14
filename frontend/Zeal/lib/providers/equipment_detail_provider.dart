// ignore: camel_case_types
import 'dart:convert';

import 'package:cbithackathon/apiservices/api_service.dart';
import 'package:cbithackathon/models/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EquipmentDetailsProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  EquipmentModel equipment = EquipmentModel();
  EquipmentModel get equipmentList {
    return equipment;
  }

  Future<void> getEquipmentList(String sportName, String equipmentName) async {
    String url = "${ApiConfig.host}main/sports/$sportName/$equipmentName";
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
      EquipmentModel repo = EquipmentModel(
          name: responseData['name'], image: responseData['image']);
      // print(responseData);
      equipment = repo;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
