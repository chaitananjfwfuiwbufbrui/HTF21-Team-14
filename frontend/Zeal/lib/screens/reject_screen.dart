import 'package:flutter/material.dart';

class RejectScreen extends StatefulWidget {
  const RejectScreen({Key? key}) : super(key: key);

  @override
  _RejectScreenState createState() => _RejectScreenState();
}

class _RejectScreenState extends State<RejectScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: height * 0.15,
            width: width * 0.7,
            child: Wrap(
              children: [
                Text(
                  'Your request for the ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '(Equipment name) for the ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '(game) , Time is not  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'available ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Image.asset('assets/images/reject.png'),
        ],
      ),
    );
  }
}
