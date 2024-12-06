import 'package:flutter/material.dart';
import 'home.dart'; // Ganti dengan halaman utama kamu

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay selama 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainHome()), // Ganti sesuai halaman utama
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/Burger.jpg'), // Gambar splash screen
      ),
    );
  }
}
