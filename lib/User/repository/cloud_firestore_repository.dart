import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_avanzado/Place/model/place.dart';
import 'package:platzi_trips_avanzado/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';
import 'package:platzi_trips_avanzado/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_avanzado/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
