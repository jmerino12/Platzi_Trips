import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart' as DomainUser;
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore_db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(DomainUser.User user) async {
    DocumentReference ref = Firestore_db.collection(USERS).doc(user.uid);
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

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = Firestore_db.collection(PLACES);
    String uid = (_auth.currentUser!).uid;
    print(place);
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'photoUrl': place.uriImage,
      'userOwner': Firestore_db.doc("$USERS/$uid")
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference refUsers = Firestore_db.collection(USERS).doc(uid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion(
              [Firestore_db.doc("$PLACES/${snapshot.id}")])
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(Place(
          name: p['name'],
          description: p['description'],
          uriImage: p['photoUrl'],
          likes: p['likes'])));
    });

    return profilePlaces;
  }

  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    double width = 300;
    double height = 350;
    double left = 20;
    double top = 80;
    List<CardImage> myPlaces = <CardImage>[];
    placesListSnapshot.forEach((p) {
      myPlaces.add(CardImage(
        width: width,
        height: height,
        marginLeft: left,
        marginTop: top,
        pathImage: p['photoUrl'],
        onPressed: () {
          likePlace(p.id);
        },
        iconData: Icons.favorite_border,
      ));
    });

    return myPlaces;
  }

  Future likePlace(String idPlace) async {
    Firestore_db.runTransaction((transaction) async {
      DocumentSnapshot placeDS =
          await Firestore_db.collection(PLACES).doc(idPlace).get();
      await transaction
          .update(placeDS.reference, {"likes": placeDS.get('likes') + 1});
    });
  }
}