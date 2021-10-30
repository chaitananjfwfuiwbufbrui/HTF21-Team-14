import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Column(
                children: [
                  Image.asset('assets/images/clock.png'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Your request has been submitted',
                    style:
                        TextStyle(fontSize: width * 0.055, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Column(
                children: [
                  Image.asset('assets/images/notification.png'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'You will get notified once',
                    style:
                        TextStyle(fontSize: width * 0.055, color: Colors.white),
                  ),
                  Text(
                    'your request has been checked',
                    style:
                        TextStyle(fontSize: width * 0.055, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
