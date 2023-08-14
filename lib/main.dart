import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/provider/bottomnav_screen.dart';
import 'package:narobytes_secondproject/provider/login_screen_provider.dart';
import 'package:narobytes_secondproject/provider/signup_screen.dart';
import 'package:narobytes_secondproject/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>BottomNavProvider(),),
        ChangeNotifierProvider(create: (context)=> LoginScreenProvider(),),
        ChangeNotifierProvider(create: (context)=>SignUpScreenProvider(),),
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Naro Bytes Social Media app",
        home: SplashScreen(),
      ),
    );
  }
}