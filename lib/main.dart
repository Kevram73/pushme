import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/sms_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Envoi de Code SMS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SmsScreen(),
    );
  }
}
