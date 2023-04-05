import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:market_fence/Screens/login_page.dart';
import 'package:market_fence/Screens/root_page.dart';

void main() {
  // runApp(const MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lexend_Deca",
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//   void dispose() {
//     _activityStreamController.close();
//     _geofenceStreamController.close();
//     super.dispose();
//   }
//
//   Widget _buildContentView() {
//     return ListView(
//       physics: const BouncingScrollPhysics(),
//       padding: const EdgeInsets.all(8.0),
//       children: [
//         _buildActivityMonitor(),
//         const SizedBox(height: 20.0),
//         _buildGeofenceMonitor(),
//       ],
//     );
//   }
//
//   Widget _buildActivityMonitor() {
//     return StreamBuilder<Activity>(
//       stream: _activityStreamController.stream,
//       builder: (context, snapshot) {
//         final updatedDateTime = DateTime.now();
//         final content = snapshot.data?.toJson().toString() ?? '';
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('•\t\tActivity (updated: $updatedDateTime)'),
//             const SizedBox(height: 10.0),
//             Text(content),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildGeofenceMonitor() {
//     return StreamBuilder<Geofence>(
//       stream: _geofenceStreamController.stream,
//       builder: (context, snapshot) {
//         final updatedDateTime = DateTime.now();
//         final content = snapshot.data?.toJson().toString() ?? '';
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('•\t\tGeofence (updated: $updatedDateTime)'),
//             const SizedBox(height: 10.0),
//             Text(content),
//           ],
//         );
//       },
//     );
//   }
// }

