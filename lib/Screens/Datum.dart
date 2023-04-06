// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.data,
  });

  List<Datum> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.brandName,
    required this.desc,
    required this.title,
    required this.lat,
    required this.long,
    // required this.likeCount,
  });

  String brandName;
  String desc;
  String title;
  String lat;
  String long;
  // String likeCount;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        brandName: json["brand_name"],
        desc: json["desc"],
        title: json["title"],
        lat: json["lat"],
        long: json["long"],
        // likeCount: json["like_count"],
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "desc": desc,
        "title": title,
        "lat": lat,
        "long": long,
        // "like_count": likeCount,
      };
}
