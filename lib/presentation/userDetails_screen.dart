import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:narobytes_secondproject/core/colors_const.dart';
import 'package:narobytes_secondproject/core/sizedbox_const.dart';
import 'package:narobytes_secondproject/provider/signup_screen.dart';
import 'package:narobytes_secondproject/utils/utils.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class UserDetailsEnterScreen extends StatelessWidget {
  const UserDetailsEnterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final userDetailsProvider=context.watch<SignUpScreenProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                userDetailsProvider.selectImage();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  userDetailsProvider.image!=null ?
                  CircleAvatar(
                    backgroundImage: 
                    MemoryImage(userDetailsProvider.image!),
                  radius: 80,
                ):
                  CircleAvatar(
                    backgroundImage: 
                    NetworkImage("https://static.vecteezy.com/system/resources/previews/008/442/086/original/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"),
                  radius: 80,
                ),
                Positioned(
                  bottom: 12,
                  left: 125,
                  child: Icon(Icons.add_a_photo,size: 35,))
                ],
              ),
            ),
            fHight20,
          TextFormWidget(title: "User name", prefixicon: Icons.person, controller: userDetailsProvider.userNameContoller, obscureText: false, keuboardtype: TextInputType.name),
          fHight10,
          TextFormWidget(title: "Bio", prefixicon: Icons.details, controller: userDetailsProvider.userBioContoller, obscureText: false, keuboardtype: TextInputType.text,paddingVerthical: 40),
          fHight10,
          TextFormWidget(title: "Date of birth", prefixicon: Icons.numbers, controller: userDetailsProvider.userDateController, obscureText: false, keuboardtype: TextInputType.datetime),
          fHight50,
          SizedBox(
            height: 50,
            child: ElevatedButton(onPressed: (){
              userDetailsProvider.userDetailsEnter(context);
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(value: "Submit", fontSize: 15, fontColor: textBlackColor, fontWeight: FontWeight.w500)
              ],
            )),
          )
        ],),
      ),
    );
  }
}