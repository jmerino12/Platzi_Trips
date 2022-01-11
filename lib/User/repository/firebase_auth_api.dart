import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signIn() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? gSa = await googleSignInAccount?.authentication;

    User? user = (await _auth.signInWithCredential(
      GoogleAuthProvider.credential(idToken:gSa?.idToken , accessToken: gSa?.accessToken )
    )).user;

    return user;
  }

  signOut() async{
    await _auth.signOut().then((value) => {print("Sesion cerrada")});
    googleSignIn.signOut();
  }
}
