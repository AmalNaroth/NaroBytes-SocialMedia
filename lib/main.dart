import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/splash_screen.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Naro Bytes Social Media app",
      home:const SplashScreen(),
    );
  }
}