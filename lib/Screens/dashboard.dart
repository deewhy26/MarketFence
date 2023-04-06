import 'package:flutter/material.dart';
import 'package:market_fence/Screens/mongodb.dart';

import '../models/Offers.dart';
import 'Datum.dart';
import 'detail_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height);
    print(width);

    List<Offer> offerList=Offer.offerList;
    return
        Scaffold(
          backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                    bottom: height*.4,
                    child: Container(
                      width: width,
                      height: height*.6,
                      color:Color(0xffdbe9f7)
                      //Color(0xff2A2C28),

                    )
                ),
                Positioned(
                    top:height*.41,
                    child: Container(
                      width: width,
                      height: height*.6,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        //Color(0xff0d1015),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 15.0, //extend the shadow
                            offset: Offset(
                              5.0, // Move to right 5  horizontally
                              5.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),

                      ),
                    )

                ),

                SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(height:height*.04),
                        Row(children: [
                          SizedBox(width: width*.82,),
                         //Image.asset(name),
                         // Text('Welcome',style:TextStyle(color: Colors.white70,fontSize:35))
                        ],),
                        SizedBox(height:height*.03),
                        Row(children: [
                          SizedBox(width: width*.05,),

                          Text('Welcome',style:TextStyle(color: Colors.white70,fontSize:30))
                        ],),
                        Row(children: [
                          SizedBox(width: width*.05,),
                          Text('Welcome,Dhruv!',style:TextStyle(color: Color(0xff0391C6),fontSize:35))
                        ],),
                        SizedBox(height:height*.05),

                        Container(
                          //color: Colors.purple,
                           // padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: height*.115,//100.0,
                            width: width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context,int index){
                                  return GestureDetector(
                                    onTap:(){
                                      setState(() {
                                       selectedIndex=index;
                                      });
                                    } ,
                                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*.0243),
                  child:
                  Stack(
                    children:[ CircleAvatar(
                      backgroundColor: Color(0xff00AEEF),
                      //Colors.white70,
                      radius: width*.1,
                    ),
                      Positioned(
                          top:height*0.1,
                          left:width*0.0632,
                          child: Text("haha,",style: TextStyle(color:Colors.white70),)
                      )
                    ]
                  )

                  ),
              );
            }),

      ),
                        SizedBox(height:height*.1385),
                    Row(children:[
                      SizedBox(width:width*.06),
                      Text("Offers Nearby!",style:TextStyle(color: Color(0xff0391C6),fontSize: 30,fontWeight: FontWeight.bold))
                    ]),
                        SizedBox(height:height*0.023),
                    Container(
                    //color: Colors.orange,
                    height: width*0.6076,
                    //height*.2,
                    child: ListView.builder(
                        itemCount: offerList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(BuildContext context,int index){
                          return GestureDetector(
                            onTap:(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(offerId: offerList[index].offerId,)));
                              //Navigator.push(context,PageTransition(child: DetailPage(plantId: offerList[index].plantId,), type: PageTransitionType.bottomToTop));
                            },
                            child: Container(
                              width: width*0.6076,
                              // height: height*.4,
                              margin: EdgeInsets.symmetric(horizontal: width*0.0243),
                              decoration: BoxDecoration(
                                color: Color(0xff0F3E99),
                                //Colors.cyan.withOpacity(.8),
                                borderRadius: BorderRadius.circular(width*0.0486),
                              ),
                              child:
                              Stack(
                                children: [
                                  // Positioned(
                                  //   top:10,
                                  //   right:20,
                                  //   child: Container(
                                  //     height: 50,
                                  //     width: 50,
                                  //     child: IconButton(
                                  //       onPressed:(){
                                  //         bool isFavorated =!Offer.offerList[index].isFavorated;
                                  //         offerList[index].isFavorated=isFavorated;
                                  //       },
                                  //       icon:Icon(Offer.offerList[index].isFavorated==true
                                  //           ? Icons.favorite : Icons.favorite_border, color: Color(0xff0F3E99),),
                                  //       color: Colors.white70,
                                  //       iconSize: 30,
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       color:Colors.white,
                                  //       borderRadius: BorderRadius.circular(50),
                                  //
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                    left: width*0.122,
                                    right:width*0.122 ,
                                    top: height*0.0577,
                                    bottom: height*0.0577,
                                    child: Image.asset(offerList[index].imageURL),),
                                  Positioned(
                                    top: 15,
                                    left:7,
                                    //right: 20,
                                    child: Column(
                                    children: [
                                      Text(
                                        //"ll",
                                        offerList[index].title,
                                        style:const TextStyle(
                                          color:Colors.white70,
                                          fontSize:16,

                                      ),
                                    ),
                                    ],
                                    ),),

                                ],
                              ),


                            ),

                          );
                        }
                    ),

                  ),
                      ],
                    ),
                ),


              ],
            ),
        );

    //   Container(
    //   child: Center(child: Text('Dashboard',style: TextStyle(color: Colors.white),)),
    // );
  }
}
