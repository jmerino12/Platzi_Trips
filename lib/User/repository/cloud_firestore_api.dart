import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';

class CloudFirestoreAPI{
  final String USER = "users";
  final String PLACE = "places";

  final Firestore_db = FirebaseFirestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = Firestore_db.collection(USER).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritesPlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}