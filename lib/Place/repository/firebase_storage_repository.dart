import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_avanzado/Place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<UploadTask> uploadFile(String path, XFile image) =>
      _firebaseStorageAPI.uploadFile(path, image);
}
