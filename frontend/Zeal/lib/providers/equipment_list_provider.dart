// ignore: camel_case_types
import 'dart:convert';

import 'package:cbithackathon/apiservices/api_service.dart';
import 'package:cbithackathon/models/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EquipmentListProvider extends ChangeNotifier {
  // ignore: deprecated_member_use
  late List<EquipmentModel> _equipmentList = [];

  List<EquipmentModel> get equipmentList {
    return [..._equipmentList];
  }

  Future<void> getEquipmentList(String sportName) async {
    String url = "${ApiConfig.host}main/sports/$sportName/";
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
      List<EquipmentModel> patientList = [];

      final responseData = json.decode(response.body) as List<dynamic>;
      // ignore: non_constant_identifier_names

      // print(responseData);
      for (int i = 0; i < responseData.length; i++) {
        EquipmentModel repo = EquipmentModel(
            name: responseData[i]['name'], image: responseData[i]['image']);

        patientList.add(repo);
      }

      _equipmentList = patientList;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
