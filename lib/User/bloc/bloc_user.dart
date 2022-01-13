import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/User/repository/auth_repository.dart';
import 'package:platzi_trips_avanzado/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  //Flujo de datos - Streams
  //Stream de Firebase
  // Si no se tuviera ese stream que viene en Firebase, utilizariamos StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  //CASOS DE USO

  Future<User?> signIn() => _auth_repository.singInFirebase();

  signOut() {
    _auth_repository.signOut();
  }

  void updateUserData(UserModel) =>
      _cloudFirestoreRepository.updateUserDataFirestore(UserModel);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  @override
  void dispose() {}
}