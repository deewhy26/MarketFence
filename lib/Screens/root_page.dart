

import 'dart:async';

import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:market_fence/Screens/bank_page.dart';
import 'package:market_fence/Screens/dashboard.dart';
import 'package:market_fence/Screens/ExplorePage.dart';
import 'package:market_fence/Screens/profile_page.dart';
import 'package:market_fence/notificationservice.dart';

import '../models/Offers.dart';

final  toDisplay = [].obs;
// Create a [Geofence] list.
class geofenceController extends GetxController {
  final geofenceList = <Geofence>[

    // Geofence(
    //   id: 'place_2',
    //   latitude: 35.104971,
    //   longitude: 129.034851,
    //   radius: [
    //     GeofenceRadius(id: 'radius_25m', length: 25),
    //     GeofenceRadius(id: 'radius_100m', length: 100),
    //     GeofenceRadius(id: 'radius_200m', length: 200),
  ];


  void check_avail(Location location) {

    for (int i = 0; i < geofenceList.length; i += 1) {
      var remDistance = Geolocator.distanceBetween(geofenceList[i].latitude, geofenceList[i].longitude, location.latitude, location.longitude);

      // print(geofenceList[i].status.toString());
      // if (geofenceList[i].status.toString() == "GeofenceStatus.ENTER" || geofenceList[i].status.toString() == "GeofenceStatus.DWELL") {
      //   NotificationService().showNotification(Offer.offerList[i].offerId, Offer.offerList[i].title,Offer.offerList[i].desc, 4 );
      //   toDisplay.add(Offer.offerList[i]);
      // }
    if (remDistance <= geofenceList[i].radius[0].length && !toDisplay.contains(Offer.offerList[i])) {
      NotificationService().showNotification(Offer.offerList[i].offerId, Offer.offerList[i].title,Offer.offerList[i].desc, 4 );
      print(Offer.offerList[i]);
      toDisplay.add(Offer.offerList[i]);
    }

      else if (remDistance > geofenceList[i].radius[0].length){
        // NotificationService().showNotification(Offer.offerList[i].offerId, Offer.offerList[i].title,Offer.offerList[i].desc, 4 );
        if (toDisplay.isNotEmpty ) {
          toDisplay.remove(Offer.offerList[i]);
        }
      }
    }
  }

}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  // final _geofenceList = <Geofence>[
  //
  //   // Geofence(
  //   //   id: 'place_2',
  //   //   latitude: 35.104971,
  //   //   longitude: 129.034851,
  //   //   radius: [
  //   //     GeofenceRadius(id: 'radius_25m', length: 25),
  //   //     GeofenceRadius(id: 'radius_100m', length: 100),
  //   //     GeofenceRadius(id: 'radius_200m', length: 200),
  // ];
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
      loiteringDelayMs: 300000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: true,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.ASC);


  //to add all geofences
  List<Offer> offerList = Offer.offerList;
  final geofenceController GeofenceContoller = Get.put(geofenceController());
  late final List<Geofence> geofenceList_local = [];


  final geofenceController checkOffers = Get.put(geofenceController());

  void addGeofences() {
    for (int i = 0; i < offerList.length; i += 1) {
      GeofenceContoller.geofenceList.add(Geofence(
          id: offerList[i].offerId.toString(),
          latitude: offerList[i].lat,
          longitude: offerList[i].long,
          radius: [GeofenceRadius(id: "rad_5000", length: 5000)]));
      geofenceList_local.add(Geofence(id: offerList[i].offerId.toString(),
          latitude: offerList[i].lat,
          longitude: offerList[i].long,
          radius: [GeofenceRadius(id: "rad_5000", length: 5000)]));
    }
  }

  // final List<Geofence> geofenceList = geofenceController().geofenceList;
  // This function is to be called when the geofence status is changed.
  Future<void> _onGeofenceStatusChanged(Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    // checkOffers.check_avail(Position);
    // print(checkOffers.toDisplay);
    _geofenceStreamController.sink.add(geofence);
  }

  // This function is to be called when the activity has changed.
  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    print('prevActivity: ${prevActivity.toJson()}');
    print('currActivity: ${currActivity.toJson()}');
    //checkOffers.check_avail(location);
    // print(checkOffers.toDisplay);
    _activityStreamController.sink.add(currActivity);
  }

  // This function is to be called when the location has changed.
  void _onLocationChanged(Location location) {
    checkOffers.check_avail(location);
    print(toDisplay);
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
    //add geofences from fetched offer list
    addGeofences();
    print(geofenceList_local);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService.addGeofenceStatusChangeListener(
          _onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(
          _onLocationServicesStatusChanged);
      _geofenceService.addActivityChangeListener(_onActivityChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(geofenceList_local).catchError(_onError);

    });

  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;


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
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              //Color(0xff0d1015),
              //Color(0xff2A2C28),
              body: IndexedStack(
                index: _bottomNavIndex,
                children: _widgetOptions(),
              ),
              bottomNavigationBar:
              //  Stack(children: [
              //   BackdropFilter(filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2)),
              //   Positioned(
              //     bottom: 20,
              //     left: width * .04,
              //     child: Container(
              //       height: height * .09,
              //       width: width * .92,
              //       decoration: BoxDecoration(
              //           border: Border.all(color: Colors.white.withOpacity(.4)),
              //           borderRadius: BorderRadius.circular(25),
              //           gradient: LinearGradient(
              //               begin: Alignment.topLeft,
              //               end: Alignment.bottomRight,
              //               colors: [
              //                 Colors.cyanAccent.withOpacity(.7),
              //                 Colors.cyanAccent.withOpacity(.5),
              //                 Colors.cyanAccent.withOpacity(.3),
              //                   ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Stack(

                    children: [
                      BackdropFilter(filter: ImageFilter.blur(
                          sigmaX: 2,
                          sigmaY: 2
                      )),
                      Positioned(
                        bottom: 20,
                        left: width * .04,
                        child: Container(
                          height: height * .09,
                          width: width * .92,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(.4)),
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
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
                        barWidth: width * 0.95,
                        indicatorHeight: 4,
                        indicatorWidth: 40,
                        indicatorColor: Colors.black38.withOpacity(0.4),
                        items: [
                          NavBarItems(
                              icon: Icons.dashboard, title: "Dashboard"),
                          NavBarItems(icon: Icons.search, title: "Explore"),
                          NavBarItems(icon: Icons.account_balance_outlined,
                              title: "Bank"),
                          NavBarItems(
                              icon: Icons.person_outline, title: "Profile"),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _bottomNavIndex = value;
                          });
                        },
                      ),
                    ]
                ),
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
