import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository{
  final _firebaseAuthAPI = FireBaseAuthAPI();

  Future<User> singInFirebase() => _firebaseAuthAPI.signIn();
}