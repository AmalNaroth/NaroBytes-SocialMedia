import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  FirebaseStorage _imageStore = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        _imageStore.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;

    String downloaUrl = await snap.ref.getDownloadURL();

    return downloaUrl;
  }
}
