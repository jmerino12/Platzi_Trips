import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart' as DomainUser;
import 'package:platzi_trips_avanzado/User/repository/auth_repository.dart';
import 'package:platzi_trips_avanzado/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_avanzado/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebasStorageRepository = FirebaseStorageRepository();

  //Flujo de datos - Streams
  //Stream de Firebase
  // Si no se tuviera ese stream que viene en Firebase, utilizariamos StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  User? get currentUser => FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();

  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();

  List<Place> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot, DomainUser.User user) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);

  //CASOS DE USO

  Future<User?> signIn() => _auth_repository.singInFirebase();

  signOut() {
    _auth_repository.signOut();
  }

  void updateUserData(UserModel) =>
      _cloudFirestoreRepository.updateUserDataFirestore(UserModel);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Future<UploadTask> uploadFile(String path, XFile image) =>
      _firebasStorageRepository.uploadFile(path, image);

  Future likePlace(Place place, String uid) =>
      _cloudFirestoreRepository.likePlace(place, uid);

  @override
  void dispose() {}
}