//
// //import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories {
  final int index;
  final String name;
  final IconData icon;


  Categories({
    this.index = 0,
    this.icon = Icons.circle_outlined,
    this.name = "",
  });

  static List <Categories> categoryList =
  [
    Categories(
      index: 0,
      icon: Icons.restaurant,
      name: "Restaurants"
    ),
    Categories(
      index: 1,

    ),
    Categories(

    ),
    Categories(

    ),
  ];
// factory Offer.fromJson(Map<String, dynamic>json)
// {
//   return Offer(
//     doctorId: json['doctorId'],
//     speciality: json['speciality'],
//     name: json['name'],
//     experience: json['experience'],
//     clinic: json['clinic'],
//     imageURL: json['imageURL'],
//   );
// }
}
