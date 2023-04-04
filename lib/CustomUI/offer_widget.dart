
import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     PageTransition(
        //         child: DetailPage(
        //           plantId: plantList[index].plantId,
        //         ),
        //         type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Container(
                //   width: 60.0,
                //   height: 60.0,
                //   decoration: BoxDecoration(
                //     color:Colors.cyan,
                //     shape: BoxShape.circle,
                //   ),
                // ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child:
                    Image.asset('demo_pic.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("abcde"),
                      Text(
                        "qwerty",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: Text(
            //     r'$' + plantList[index].price.toString(),
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18.0,
            //       color: Constants.primaryColor,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
