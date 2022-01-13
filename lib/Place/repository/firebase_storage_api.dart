import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageAPI {
  final Reference _firebaseStorage = FirebaseStorage.instance.ref();

  Future<UploadTask> uploadFile(String path, XFile image) async {
    UploadTask storageUploadTask =
        _firebaseStorage.child(path).putFile(File(image.path));
    return storageUploadTask;
  }
}
