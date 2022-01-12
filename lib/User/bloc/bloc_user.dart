import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/repository/auth_repository.dart';
import 'package:platzi_trips_avanzado/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  //Flujo de datos - Streams
  //Stream de Firebase
  // Si no se tuviera ese stream que viene en Firebase, utilizariamos StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  //CASOS DE USO

  Future<User?> signIn() {
    return _auth_repository.singInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserData(UserModel) =>
      _cloudFirestoreRepository.updateUserDataFirestore(UserModel);

  @override
  void dispose() {}
}