import 'package:flutter/material.dart';
import 'package:my_app/screens/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Membuat delay selama 3 detik untuk menampilkan splash screen
    Future.delayed(Duration(seconds: 3), () {
      // Setelah 3 detik, navigasi ke halaman beranda
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Ganti dengan warna latar belakang yang Anda inginkan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan gambar splash screen Anda
            Image.asset(
              'assets/images/warung.jpg',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              'Warung Padalyang',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}