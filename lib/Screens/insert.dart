import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({Key? key}) : super(key: key);

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(
            "Insert Data",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    ));
  }
}
