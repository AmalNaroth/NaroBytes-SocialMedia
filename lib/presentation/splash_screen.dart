import 'dart:async';

import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/core/colors_const.dart';
import 'package:narobytes_secondproject/presentation/login_page.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),(){
      callsplashscreen();
    });
  }

  void callsplashscreen(){
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),)) ;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgBlackColor,
      body: Center(
        child: TextWidget(value: "N A R O B Y T E S", fontSize: 40, fontColor: textWhiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}