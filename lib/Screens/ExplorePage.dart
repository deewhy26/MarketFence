import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Datum.dart';
import 'mongodb.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
            future: MongoDatabase.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  print("Total Data." + totalData.toString());
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return displayCard(
                            Datum.fromJson(snapshot.data[index]));
                      });
                } else {
                  return Center(
                    child: Text("No Data Available."),
                  );
                }
              }
            }),
      )),
    );
  }

  Widget displayCard(Datum data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("${data.brandName}"),
            SizedBox(
              height: 5,
            ),
            Text("${data.desc}"),
            SizedBox(
              height: 5,
            ),
            Text("${data.title}"),
            SizedBox(
              height: 5,
            ),
            Text("${data.lat}"),
            SizedBox(
              height: 5,
            ),
            Text("${data.long}"),
            SizedBox(
              height: 5,
            ),
            Text("${data.likeCount}"),
          ],
        ),
      ),
    );
  }
}
