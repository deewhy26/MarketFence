
import 'dart:ui';

import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff0d1015),
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
          iconColor: Colors.white,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          iconSize: 20.0,
          //barHeight: 20,
          indicatorHeight: 4,
          indicatorWidth: 40,
          indicatorColor: Colors.white70.withOpacity(0.4),
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
    );
  }
}
