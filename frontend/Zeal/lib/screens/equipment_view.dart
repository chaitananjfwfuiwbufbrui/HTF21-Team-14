// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:cbithackathon/apiservices/api_service.dart';
import 'package:cbithackathon/providers/equipment_detail_provider.dart';
import 'package:cbithackathon/screens/request_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class EquipmentView extends StatefulWidget {
  EquipmentView(
      {Key? key, required this.equipmentname, required this.sportname})
      : super(key: key);
  String sportname;
  String equipmentname;
  @override
  _EquipmentViewState createState() => _EquipmentViewState();
}

class _EquipmentViewState extends State<EquipmentView> {
  Future<void> bookequipment(String date, String quantity) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    String url =
        "${ApiConfig.host}main/request/${widget.sportname}/${widget.equipmentname}/";
    // ignore: avoid_print
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'JWT $obtainedToken',
        },
        body: jsonEncode({
          'date': date,
          'qty': quantity,
        }));
    // ignore: avoid_print
    print(response.statusCode);
    // ignore: avoid_print
    print(response.body);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RequestScreen()),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(json.decode(response.body)["detail"]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            );
          });

      throw Exception('Failed to load data!');
    }
  }

  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<EquipmentDetailsProvider>(context)
          .getEquipmentList(widget.sportname, widget.equipmentname)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  TextEditingController time = TextEditingController();
  TextEditingController quantity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final equipmentData = Provider.of<EquipmentDetailsProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: height * 0.5,
                    width: width * 0.9,
                    child: Image.asset(
                      'assets/images/equipment.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  _isLoading ? '' : '${equipmentData.equipment.name}',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 2),
                      child: TextFormField(
                        controller: time,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: 'Time',
                          hintStyle: TextStyle(fontSize: width * 0.04),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 2),
                      child: TextFormField(
                        controller: quantity,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: 'Quantity',
                          hintStyle: TextStyle(fontSize: width * 0.04),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      bookequipment(time.text, quantity.text);
                    },
                    child: Text(
                      "Request",
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
