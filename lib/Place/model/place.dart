import 'package:flutter/cupertino.dart';

class Place {
  String? id;
  String name;
  String description;
  String? uriImage;
  int? likes;
  bool? liked;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      this.uriImage,
      this.likes,
      this.liked,
      this.id});
}
