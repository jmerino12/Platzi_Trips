import 'package:flutter/cupertino.dart';
import 'package:platzi_trips_avanzado/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String? uriImage;
  int? likes;
  User? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.uriImage,
      this.likes,
      this.userOwner});
}
