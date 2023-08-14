import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:narobytes_secondproject/presentation/userDetails_screen.dart';
import 'package:narobytes_secondproject/resources/storage_image.dart';
import 'package:narobytes_secondproject/utils/utils.dart';
import 'package:narobytes_secondproject/widgets/common_widgets.dart';

class SignUpScreenProvider extends ChangeNotifier {
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPassworController =
      TextEditingController();
  final TextEditingController _signupConformPasswrod = TextEditingController();

  TextEditingController get signupEmailController => _signupEmailController;
  TextEditingController get signupPasswordController =>
      _signupPassworController;
  TextEditingController get signupConformPasswrod => _signupConformPasswrod;

  //userDetails
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userBioController = TextEditingController();
  final TextEditingController _userDateContoller = TextEditingController();
  TextEditingController get userNameContoller => _userNameController;
  TextEditingController get userBioContoller => _userBioController;
  TextEditingController get userDateController => _userDateContoller;

  UserCredential? cred;
  Uint8List? image;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> signinUser(BuildContext context) async {
    if (_signupEmailController.text.isNotEmpty &&
        _signupPassworController.text.isNotEmpty &&
        _signupConformPasswrod.text.isNotEmpty) {
      if (_signupConformPasswrod.text == _signupPassworController.text) {
        try {
          cred = await _auth.createUserWithEmailAndPassword(
              email: _signupEmailController.text,
              password: _signupConformPasswrod.text);
          navigateToScreen(context, const UserDetailsEnterScreen());
        } catch (err) {
          CustomSnackbar.show(context, err.toString());
        }
      } else {
        CustomSnackbar.show(context, "The passwords are mismatched");
      }
    } else {
      CustomSnackbar.show(context, "Enter all the details");
      navigateToScreen(context, const UserDetailsEnterScreen());
    }
  }

  Future<void> userDetailsEnter(BuildContext context) async {
    if (_userNameController.text.isNotEmpty &&
        _userBioController.text.isNotEmpty &&
        _userDateContoller.text.isNotEmpty &&
        image != null) {
      try {
        String _imageUrl= await  StorageMethod().uploadImageToStorage("userProfile", image!, false);
        await _fireStore.collection("users").doc(cred!.user!.uid).set({
          "userName" : _userNameController.text,
          "userBio" : _userBioController.text,
          "userEmail" : _signupEmailController.text,
          "userProfile" : _imageUrl,
        });
      } catch (err) {}
    } else {
      CustomSnackbar.show(context, "Fill all details");
    }
  }


  // image picker
  void selectImage() async {
    Uint8List imagePath = await pickImage(ImageSource.gallery);
    image=imagePath;
    notifyListeners();
  }
}
