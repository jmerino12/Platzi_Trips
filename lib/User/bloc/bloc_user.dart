import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_avanzado/User/repository/auth_repository.dart';

class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  //CASOS DE USO

  Future<User?> signIn(){
    return _auth_repository.singInFirebase();
  }

  @override
  void dispose() {

  }
}