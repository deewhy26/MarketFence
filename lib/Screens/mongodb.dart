import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constant.dart';

class MongoDatabase {
  static var userCollection;

  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    userCollection = db.collection(COLLECTION_NAME);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }
}
