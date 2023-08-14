import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/core/colors_const.dart';
import 'package:narobytes_secondproject/core/sizedbox_const.dart';
import 'package:narobytes_secondproject/presentation/sign-up_page.dart';

class TextWidget extends StatelessWidget {
  String value;
  double fontSize;
  Color fontColor;
  FontWeight fontWeight;
   TextWidget({super.key,required this.value,required this.fontSize,required this.fontColor,required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return  Text(
      value,style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight
      ),
    );
  }
}


class TextFormWidget extends StatelessWidget {
  TextEditingController controller;
  String title;
  IconData prefixicon;
  IconData? sufixIcon;
  bool obscureText;
  TextInputType keuboardtype;
  double paddingVerthical;
  double paddingHorizontal;
   TextFormWidget({super.key,required this.title,required this.prefixicon,this.sufixIcon,required this.controller,required this.obscureText,required this.keuboardtype,this.paddingVerthical=0,this.paddingHorizontal=0});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keuboardtype,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: paddingVerthical,horizontal: paddingHorizontal),
      border: OutlineInputBorder(),
      prefixIcon: Icon(prefixicon),
      suffixIcon: Icon(sufixIcon),
      filled: true,
      fillColor: Colors.grey.withOpacity(.5),
      label: TextWidget(value: title, fontSize: 20, fontColor: textWhiteColor, fontWeight: FontWeight.w500),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 153, 0, 255)
        ),
      ),
    ),
    );
  }
}

//google && mobile
class SignUpButton extends StatelessWidget {
  bool iconVisibility;
  bool imageVisibility;
  String title;
   SignUpButton({super.key,required this.iconVisibility,required this.imageVisibility,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: iconVisibility,
            child: Icon(Icons.phone_android,color: Color.fromARGB(255, 145, 3, 253),size: 30,)),
        Visibility(
          visible: imageVisibility,
          child: Image.asset("assets/images/google-logo.png",height: 30,)),
        fWidth20,
        TextWidget(value: title, fontSize: 20, fontColor: textBlackColor, fontWeight: FontWeight.w500),
      ],),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  Color bgcolor;
  String title;
  double textSize;
   ElevatedButtonWidget({super.key,required this.bgcolor,required this.title,required this.textSize});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 13)
      ),
      onPressed: (){
        
      }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(value: title, fontSize: 20, fontColor: textWhiteColor, fontWeight: FontWeight.w600)
                  ],
                ),);
  }
}

//navigator

void navigateToScreen(BuildContext context,Widget moveScreen){
  final screenNav=MaterialPageRoute(builder: (context) => moveScreen,);
  Navigator.of(context).push(screenNav);
}

//snackbar

class CustomSnackbar {
  static void show(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}