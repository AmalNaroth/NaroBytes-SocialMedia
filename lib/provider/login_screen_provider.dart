import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/presentation/bottomnav_screen.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';

class LoginScreenProvider extends ChangeNotifier {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _passwordPasswordController = TextEditingController();

  TextEditingController get loginEmailContoller=>_loginEmailController;
  TextEditingController get loginPasswordController=> _passwordPasswordController;
  FirebaseAuth _auth=FirebaseAuth.instance;

  void loginUser(BuildContext context) async{
    if(_loginEmailController.text.isNotEmpty && _passwordPasswordController.text.isNotEmpty){
      try{
        await _auth.signInWithEmailAndPassword(email: _loginEmailController.text, password: _passwordPasswordController.text);
        navigateToScreen(context, BottomNavBarScreen());
        CustomSnackbar.show(context, "Login success");
      }catch(err){
        CustomSnackbar.show(context, err.toString());
      }
    }else{
      CustomSnackbar.show(context, "Enter all details");
    }
  }
}
