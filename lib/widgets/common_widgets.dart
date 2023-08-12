import 'package:flutter/material.dart';

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