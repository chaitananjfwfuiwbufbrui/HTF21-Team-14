import 'dart:convert';
import 'package:cbithackathon/apiservices/api_service.dart';
import 'package:cbithackathon/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cbithackathon/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<LoginResponseModel> login(String email, String password) async {
    String url = "${ApiConfig.host}auth/jwt/create/";
    LoginRequestModel requestModel =
        LoginRequestModel(email: email, password: password);
    // ignore: avoid_print
    print(jsonEncode(requestModel.toJson()));
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestModel.toJson()));
    // ignore: avoid_print
    print(response.statusCode);
    // ignore: avoid_print
    print(response.body);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(response.body);
      Map<String, dynamic> output = json.decode(response.body);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("token", output['access']);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      return LoginResponseModel.fromJson(
        json.decode(response.body),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text("Ok"))
              ],
            );
          });

      throw Exception('Failed to load data!');
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: ListView(
        children: [
          Container(
            height: height,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: height * 0.75,
                    width: width,
                    decoration: const BoxDecoration(
                      color: Color(0xffE9FCAB),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Image.asset('assets/images/login.png'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          'Zeal',
                          style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Container(
                          height: height * 0.07,
                          width: width * 0.7,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 2),
                              child: TextFormField(
                                controller: email,
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  hintText: 'Username',
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
                          width: width * 0.7,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 2),
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                // ignore: prefer_const_constructors
                                decoration: InputDecoration(
                                  hintText: 'Password',
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.8,
                  child: MaterialButton(
                    onPressed: () {
                      login(email.text, password.text);
                    },
                    child: SizedBox(
                      height: height * 0.1,
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: width * 0.1,
                            color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
