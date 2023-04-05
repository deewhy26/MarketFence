
import 'dart:async';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:market_fence/Screens/bank_page.dart';
import 'package:market_fence/Screens/dashboard.dart';
import 'package:market_fence/Screens/explore_page.dart';
import 'package:market_fence/Screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> _widgetOptions() {
    return [
      Dashboard(),
      ExplorePage(),
      BankPage(),
      ProfilePage(),
    ];
  }

  List<Widget> iconList = [
    Icon(
      Icons.dashboard,
      color: Colors.white70,
    ),
    Icon(
      Icons.search,
      color: Colors.white70,
    ),
    Icon(
      Icons.account_balance_outlined,
      color: Colors.white70,
    ),
    Icon(
      Icons.person_outline,
      color: Colors.white70,
    ),
    // Icon(Icons.person),
  ];
  final _activityStreamController = StreamController<Activity>();
  final _geofenceStreamController = StreamController<Geofence>();

  // Create a [GeofenceService] instance and set options.
  final _geofenceService = GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);

  // Create a [Geofence] list.
  final _geofenceList = <Geofence>[
    Geofence(
      id: 'place_1',
      latitude: 19.32346,
      longitude: 72.8761633,
      radius: [
        GeofenceRadius(id: 'radius_100m', length: 100),
        GeofenceRadius(id: 'radius_25m', length: 25),
        GeofenceRadius(id: 'radius_250m', length: 250),
        GeofenceRadius(id: 'radius_200m', length: 200),
      ],
    ),
    Geofence(
      id: 'place_2',
      latitude: 35.104971,
      longitude: 129.034851,
      radius: [
        GeofenceRadius(id: 'radius_25m', length: 25),
        GeofenceRadius(id: 'radius_100m', length: 100),
        GeofenceRadius(id: 'radius_200m', length: 200),
      ],
    ),
  ];

  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    _geofenceStreamController.sink.add(geofence);
  }

  // This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    print('prevActivity: ${prevActivity.toJson()}');
    print('currActivity: ${currActivity.toJson()}');
    _activityStreamController.sink.add(currActivity);
  }

  // This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    print('location: ${location.toJson()}');
  }



  // This function is to be called when a location services status change occurs
  // since the service was started.
  void _onLocationServicesStatusChanged(bool status) {
    print('isLocationServicesEnabled: $status');
  }

  // This function is used to handle errors that occur in the service.
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
      _geofenceService.addActivityChangeListener(_onActivityChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(_geofenceList).catchError(_onError);
    });
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return MaterialApp(
      // A widget used when you want to start a foreground task when trying to minimize or close the app.
      // Declare on top of the [Scaffold] widget.
        home: WillStartForegroundTask(
        onWillStart: () async {
      // You can add a foreground task start condition.
      return _geofenceService.isRunningService;
    },
    androidNotificationOptions: AndroidNotificationOptions(
    channelId: 'geofence_service_notification_channel',
    channelName: 'Geofence Service Notification',
    channelDescription: 'This notification appears when the geofence service is running in the background.',
    channelImportance: NotificationChannelImportance.LOW,
    priority: NotificationPriority.LOW,
    isSticky: false,
    ),
    iosNotificationOptions: const IOSNotificationOptions(),
    notificationTitle: 'Geofence Service is running',
    notificationText: 'Tap to return to the app',
    foregroundTaskOptions: ForegroundTaskOptions(),
    child:Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      //Color(0xff0d1015),
      //Color(0xff2A2C28),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),

      bottomNavigationBar:

      Stack(
        children:[
          BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2
          )),
          Positioned(
            bottom:20 ,
            left: width*.04,
            child: Container(
              height: height*.09,
              width: width*.92,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(.4)),
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                      begin:Alignment.topLeft,
                      end:Alignment.bottomRight,
                      colors: [

                        Colors.cyanAccent.withOpacity(.7),
                        Colors.cyanAccent.withOpacity(.5),
                        Colors.cyanAccent.withOpacity(.3),

                        // Color(0xff00b0ee).withOpacity(.7),
                        // Color(0xff00b0ee).withOpacity(.5),
                        // Color(0xff00b0ee).withOpacity(.3),

                        // Colors.white.withOpacity(0.4),
                        // Colors.white70.withOpacity(0.1),
                      ]
                  )
              ),
            ),
          ),
          FloatingNavigationBar(
          backgroundColor: Colors.transparent,
          iconColor: Colors.black87,
          textStyle: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
          ),
          iconSize: 20.0,
          //barHeight: 20,
          indicatorHeight: 4,
          indicatorWidth: 40,
          indicatorColor: Colors.black38.withOpacity(0.4),
          items: [
            NavBarItems(icon:Icons.dashboard,title: "Dashboard"),
            NavBarItems( icon: Icons.search,title: "Explore"),
            NavBarItems(icon: Icons.account_balance_outlined, title: "Bank"),
            NavBarItems(icon: Icons.person_outline,title: "Profile"),
          ],
          onChanged: (value) {
           setState(() {
             _bottomNavIndex=value;
           });
          },
        ),
        ]
      ),


      // CurvedNavigationBar(
      //   // backgroundColor: Colors.transparent,
      //   color: Color(0xff2A2C28),
      //   buttonBackgroundColor: Color(0xff6FBDB4),
      //   items: iconList,
      //   index: _bottomNavIndex,
      //   backgroundColor: Color(0xff151413),
      //   // backgroundColor: AppColors.bgcolor40percent,
      //   // buttonBackgroundColor: Colors.transparent,
      //
      //   height: 60,
      //   onTap: (index) {
      //     setState(() {
      //       _bottomNavIndex = index;
      //     });
      //   },
      // ),
    )));
  }
}
