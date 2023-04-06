
import 'package:flutter/material.dart';

import '../models/Offers.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;



class DetailPage extends StatefulWidget {

  const DetailPage({Key? key,required this.offerId}) : super(key: key);
  final int offerId;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff151413),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff2A2C28),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white70,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');

                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xffb74093),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.favorite),
                      color: Colors.white,
                    ),
                    //   child: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //
                    //         });
                    //       },
                    //
                    // ),
                  ),
                )

              ],
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            // right: 0,
            child: Container(
              width: width ,
              height: height,
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    // right:10,
                    child: SizedBox(
                      height: height*.35,
                      width: width,
                      child: Image.asset(Offer.offerList[widget.offerId].imageURL, fit: BoxFit.cover,),

                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: height * .5,
              width: width,
              decoration: BoxDecoration(
                color: const Color(0xff2A2C28),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Offer.offerList[widget.offerId].name,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                Offer.offerList[widget.offerId].desc,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: () {

                            print("location cheked");
                            final longitude = Offer.offerList[widget.offerId].long;
                            final latitude = Offer.offerList[widget.offerId].lat;
                            print(latitude);
                            print(longitude);
                            openMaps(longitude, latitude);

                          },

                          child: Positioned(
                            top: 0,
                            right: 0,
                            child: Container(

                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xFFFF9000),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openMaps(double longitude, double latitude) async {
    final urlString = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    print(urlString);
    Uri url = Uri.parse(urlString);
    if (await UrlLauncher.canLaunchUrl(url)) {
      await UrlLauncher.launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }//function to open location on map
}


