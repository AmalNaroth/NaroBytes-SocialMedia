import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/core/colors_const.dart';
import 'package:narobytes_secondproject/core/sizedbox_const.dart';
import 'package:narobytes_secondproject/presentation/sign-up_page.dart';
import 'package:narobytes_secondproject/provider/login_screen_provider.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   final loginProvider= context.watch<LoginScreenProvider>();
    return  Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                TextWidget(value: "N A R O B Y T E S", fontSize: 45, fontColor: textBlackColor, fontWeight: FontWeight.w800),
                fHight60,
                TextFormWidget(title: "Email id", prefixicon: Icons.email_outlined,controller: loginProvider.loginEmailContoller,obscureText: false,keuboardtype: TextInputType.emailAddress),
                fHight10,
                TextFormWidget(title: "Password", prefixicon: Icons.password,sufixIcon: Icons.remove_red_eye,controller: loginProvider.loginPasswordController,obscureText: true,keuboardtype: TextInputType.visiblePassword,),
                fHight10,
               ElevatedButton(onPressed: (){
                loginProvider.loginUser(context);
               }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(value: "Sign in", fontSize: 20, fontColor: textBlackColor, fontWeight: FontWeight.normal)
                ],
               )),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){}, child: TextWidget(value: "Forgott password", fontSize: 15, fontColor: Colors.blue, fontWeight: FontWeight.w600))),
                SignUpButton(iconVisibility: false,imageVisibility: true,title: "Sigin in with goole"),
                fHight20,
                SignUpButton(iconVisibility: true,imageVisibility: false,title: "Mobile number",),
                fHight100,
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const SignUpScreen(),));
                }, child: TextWidget(value: "Create new account", fontSize: 15, fontColor: textBlackColor, fontWeight: FontWeight.w500),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}