
import 'package:flutter/material.dart';

import '../models/Offers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex=0;
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
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
                      color: Color(0xff2A2C28),

                    )
                ),
                Positioned(
                    top:height*.41,
                    child: Container(
                      width: width,
                      height: height*.6,
                      decoration: BoxDecoration(
                        color: Color(0xff0d1015),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),

                    )
                ),

                Column(
                    children: [
                      SizedBox(height:height*.04),
                      Row(children: [
                        SizedBox(width: width*.82,),
                       IconButton(onPressed: (){},
                           color: Colors.white70,
                           iconSize: 35,
                           icon: Icon(Icons.location_on))
                       // Text('Welcome',style:TextStyle(color: Colors.white70,fontSize:35))
                      ],),
                      SizedBox(height:height*.03),
                      Row(children: [
                        SizedBox(width: width*.05,),
                        Text('Welcome',style:TextStyle(color: Colors.white70,fontSize:35))
                      ],),
                      Row(children: [
                        SizedBox(width: width*.05,),
                        Text('Dhruv',style:TextStyle(color: Colors.white70,fontSize:30))
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
                child:Stack(
                  children:[ CircleAvatar(
                    backgroundColor: Colors.white70,
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
                    Text("Offers",style:TextStyle(color: Colors.white70,fontSize: 30))
                  ]),
                      SizedBox(height:height*0.023),
                  Container(
                  //color: Colors.orange,
                  height: height*.2,
                  child: ListView.builder(
                      itemCount: offerList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(BuildContext context,int index){
                        return GestureDetector(
                          onTap:(){
                            //Navigator.push(context,PageTransition(child: DetailPage(plantId: _plantList[index].plantId,), type: PageTransitionType.bottomToTop));
                          },
                          child: Container(
                            width: width*0.6076,
                            // height: height*.4,
                            margin: EdgeInsets.symmetric(horizontal: width*0.0243),
                            decoration: BoxDecoration(
                              color: Colors.cyan.withOpacity(.8),
                              borderRadius: BorderRadius.circular(width*0.0486),
                            ),
                            child:
                            Stack(
                              children: [
                                Positioned(
                                  left: width*0.122,
                                  right:width*0.122 ,
                                  top: height*0.0577,
                                  bottom: height*0.0577,
                                  child: Image.asset('assets/demo_pic.jpg'),),
                                Positioned(
                                  bottom: 15,
                                  left: 20,
                                  child: Column(
                children: [
                  Text(
                    "lalalala",
                    //_plantList[index].category,
                    style:const TextStyle(
                      color:Colors.white70,
                      fontSize:16,

                    ),
                  ),
                  Text(
                    "qwerty",
                    //_plantList[index].plantName,
                    style:  const TextStyle(
                      color:Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),

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













              ],
            ),
        );
    //   Container(
    //   child: Center(child: Text('Dashboard',style: TextStyle(color: Colors.white),)),
    // );
  }
}
