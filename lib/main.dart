import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_screen.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/makanan_screen.dart';
import 'package:my_app/screens/riwayat_screen.dart';
import 'package:my_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //matiin debug icon
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
