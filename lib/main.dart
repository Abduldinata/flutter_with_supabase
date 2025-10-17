import 'package:flutter/material.dart';
import 'login_screen.dart';
// import 'package:myapp/penghitung_screen.dart';
// import 'package:myapp/profil_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
    theme: ThemeData(
    useMaterial3: false, // tambahkan baris ini
    primarySwatch: Colors.blue,
    ),
  
      home: const LoginScreen(),
    );
  }
}