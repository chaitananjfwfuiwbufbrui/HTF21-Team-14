import 'package:cbithackathon/providers/equipment_detail_provider.dart';
import 'package:cbithackathon/providers/equipment_list_provider.dart';
import 'package:cbithackathon/providers/user_details_provider.dart';
import 'package:cbithackathon/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EquipmentListProvider()),
        ChangeNotifierProvider.value(value: EquipmentDetailsProvider()),
        ChangeNotifierProvider.value(value: UserDetailsProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen(),
      ),
    );
  }
}
