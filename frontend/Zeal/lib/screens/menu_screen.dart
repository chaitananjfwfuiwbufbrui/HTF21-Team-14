import 'package:cbithackathon/providers/user_details_provider.dart';
import 'package:cbithackathon/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserDetailsProvider>(context).getUserDetails().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDetailsProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffE9FCAB),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hi ${userData.user.firstName}",
              style: TextStyle(
                  fontSize: width * 0.055, fontWeight: FontWeight.normal),
            ),
            Text(
              "20211AXXXX",
              style: TextStyle(
                fontSize: width * 0.035,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              "Request",
              style: TextStyle(
                fontSize: width * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.5,
              width: width * 0.6,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sport name(equipment name)',
                          style: TextStyle(fontSize: width * 0.055),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: height * 0.07,
              width: width * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xffc4c4c4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                onPressed: () {
                  Future getToken() async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove('token');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  }

                  getToken();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
