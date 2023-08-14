import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/core/colors_const.dart';
import 'package:narobytes_secondproject/core/sizedbox_const.dart';
import 'package:narobytes_secondproject/presentation/userDetails_screen.dart';
import 'package:narobytes_secondproject/provider/signup_screen.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpScrenProvider=context.watch<SignUpScreenProvider>();
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextFormWidget(title: "Email id", prefixicon: Icons.email_outlined, controller: signUpScrenProvider.signupEmailController,obscureText: false,keuboardtype: TextInputType.emailAddress),
          fHight10,
          TextFormWidget(title: "Passwrod", prefixicon: Icons.email_outlined, controller: signUpScrenProvider.signupPasswordController,obscureText: true,keuboardtype: TextInputType.visiblePassword),
          fHight10,
          TextFormWidget(title: "Conform passwrod", prefixicon: Icons.email_outlined, controller: signUpScrenProvider.signupConformPasswrod,obscureText: true,keuboardtype: TextInputType.visiblePassword),
          fHight20,
          ElevatedButton(onPressed: (){
          signUpScrenProvider.signinUser(context);
          }, child: TextWidget(value: "Continue", fontSize: 20, fontColor: textBlackColor, fontWeight: FontWeight.w500),)
        ],),
      ),
    );
  }
}