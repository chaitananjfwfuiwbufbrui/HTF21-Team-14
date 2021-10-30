import 'package:cbithackathon/providers/user_details_provider.dart';
import 'package:cbithackathon/screens/menu_screen.dart';
import 'package:cbithackathon/screens/sportsScreens/basket_ball.dart';
import 'package:cbithackathon/screens/sportsScreens/cricket.dart';
import 'package:cbithackathon/screens/sportsScreens/foot_ball.dart';
import 'package:cbithackathon/screens/sportsScreens/hockey.dart';
import 'package:cbithackathon/screens/sportsScreens/tennis.dart';
import 'package:cbithackathon/screens/sportsScreens/volley_ball.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      endDrawer: const Drawer(
        child: MenuScreen(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.6,
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: Column(
                          children: [
                            Text(
                              _isLoading
                                  ? 'Hi '
                                  : "Hi ${userData.user.firstName}",
                              style: TextStyle(fontSize: width * 0.045),
                            ),
                            Text(
                              '20211AXXXX',
                              style: TextStyle(
                                  fontSize: width * 0.03, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  child: Image.asset('assets/images/menu.png'),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.2,
            width: width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xffE9FCAB),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'which game do',
                    style: TextStyle(
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'you want to play??',
                    style: TextStyle(
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.66,
            child: Stack(
              children: [
                Positioned(
                  top: height * 0.23,
                  left: width * 0.04,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tennis()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.27,
                      width: height * 0.27,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/tennis.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.01,
                  left: width * 0.2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cricket()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.2,
                      width: height * 0.2,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/cricket.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.085,
                  left: width * 0.63,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FootBall()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.15,
                      width: height * 0.15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/football.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.25,
                  left: width * 0.6,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Hockey()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.2,
                      width: height * 0.2,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/hockey.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.48,
                  left: width * 0.63,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BasketBall()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.15,
                      width: height * 0.15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/basketball.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.5,
                  left: width * 0.28,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VolleyBall()),
                          (route) => true);
                    },
                    child: Container(
                      height: height * 0.17,
                      width: height * 0.15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: Image.asset(
                        'assets/images/volleyball.png',
                        fit: BoxFit.contain,
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
