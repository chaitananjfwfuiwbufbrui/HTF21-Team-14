import 'package:cbithackathon/screens/equipment_view.dart';
import 'package:cbithackathon/providers/equipment_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hockey extends StatefulWidget {
  const Hockey({Key? key}) : super(key: key);

  @override
  _HockeyState createState() => _HockeyState();
}

class _HockeyState extends State<Hockey> {
  var _init = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<EquipmentListProvider>(context)
          .getEquipmentList('hockey')
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    final equipmentData = Provider.of<EquipmentListProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffE6F5B8),
      body: Column(
        children: [
          Container(
            height: height * 0.4,
            width: width,
            decoration: const BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Image.asset('assets/images/hockeypic.png'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: SizedBox(
                height: height * 0.6,
                width: width * 0.7,
                child: ListView.builder(
                    itemCount: equipmentData.equipmentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EquipmentView(
                                        sportname: 'hockey',
                                        equipmentname:
                                            "${equipmentData.equipmentList[index].name}",
                                      )),
                              (route) => false),
                          child: Container(
                            height: height * 0.15,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "${equipmentData.equipmentList[index].name}",
                                style: TextStyle(
                                  fontSize: width * 0.06,
                                  color: const Color(0xffE9FCAB),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}