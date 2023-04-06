
import 'package:flutter/material.dart';

import '../CustomUI/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0d1015),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*.1,),
                Container(
                  width: 150,
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.cyanAccent,
                      width: 5.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(width: width*.35,),
                    Text(
                      'Dhruv Yadav',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    // SizedBox(
                    //     height: 24,
                    //     child: Image.asset("assets/images/verified.png")),
                  ],
                ),
                Text(
                  'dhruv@gmail.com',
                  style: TextStyle(
                    color: Colors.white70.withOpacity(.3),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: height * .7,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // LikeWidget(
                      //   icon: Icons.Like,
                      //   title: 'Liked offers',
                      // ),
                      ProfileWidget(
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      ProfileWidget(
                        icon: Icons.notifications,
                        title: 'Notifications',
                      ),
                      // ProfileWidget(
                      //   icon: Icons.chat,
                      //   title: 'FAQs',
                      // ),
                      // ProfileWidget(
                      //   icon: Icons.share,
                      //   title: 'Share',
                      // ),
                      ProfileWidget(
                        icon: Icons.logout,
                        title: 'Log Out',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
