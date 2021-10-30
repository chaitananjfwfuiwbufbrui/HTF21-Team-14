import 'package:flutter/material.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({Key? key}) : super(key: key);

  @override
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
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
                  '(game) , Time has been  ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'approved ',
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
          Image.asset('assets/images/accept.png'),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: height * 0.15,
            width: width * 0.7,
            child: Wrap(
              children: [
                Text(
                  'please collect your',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'equipment from the ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'sports complex at your ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'time slot',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: width * 0.055,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
