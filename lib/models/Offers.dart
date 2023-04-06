//
// //import 'package:http/http.dart' as http;
class Offer {
  final int offerId;
  String name;
  String imageURL;
  final String desc;
  final String title;
  final double lat;
  final double long;
  final int like_count;
  final String brand_logo;
  bool isFavorated=false;

  Offer({
    this.offerId = 0,
    this.name = "q",
    this.imageURL = 'assets/demo_pic.jpg',
    this.desc="q",
    this.title="q",
    this.lat=0,
    this.long=0,
    this.like_count=0,
    this.brand_logo="q",
    required this.isFavorated

  });

  static List <Offer> offerList =
  [
    Offer(
      offerId: 0,
      name:"Mohit",
      imageURL: "assets/demo_pic.jpg",
      desc: "Attention, all sneakerheads and athleisure enthusiasts! Get ready to elevate your fashion game with Nike's latest collection of new arrivals. And the best part? You can now avail an amazing discount of 40% off on all new arrivals from Nike! So, what are you waiting for? Head over to the Nike website or your nearest Nike store to explore the latest collection of new arrivals and take advantage of the amazing 40% off discount offer. Don't miss out on this incredible deal to get your hands on the latest Nike products at a fraction of the price. Hurry, this offer won't last forever!",
      title: "Up to 40% Off on new arrivals",
        lat: 19.136326,
        long: 72.827660,
        isFavorated:false
    ),
    Offer(
      offerId: 1,
      name:"Apple",
      imageURL: "assets/demo_pic.jpg",
      desc: "Are you looking to upgrade your gadgets with the latest Apple products? Now is the perfect time to do so, as you can avail an amazing discount of 12% off on all Apple products! Don't miss out on this amazing offer and take advantage of the discount while it lasts. Keep in mind that deals and promotions are subject to change and may not be available in all regions, so be sure to check with Apple or authorized resellers for the latest offers.",
      title: "Get 15% Off on all products",
        isFavorated:false
    ),
    Offer(
      offerId: 2,
      name:"Belgian Waffle Co.",
      imageURL: "assets/demo_pic.jpg",
      desc: "If you're a fan of delicious waffles, you won't want to miss this amazing deal from the Belgian Waffle Co.! For a limited time, you can get a discount of Rs. 100 off your bill when you visit any of their participating locations.This is a great opportunity to indulge in some mouth-watering waffles without breaking the bank. Whether you prefer classic waffles with butter and syrup, or more adventurous options like Nutella and fruit, the Belgian Waffle Co. has something for everyone.To avail this offer, simply visit a participating Belgian Waffle Co. location and make a purchase of Rs. 500 or more. You'll receive an instant discount of Rs. 100 off your bill, making your waffle experience even sweeter.",
      title: "Get Rs. 100 off on your bill",
        isFavorated:false
    ),


  ];
  // factory Offer.fromJson(Map<String, dynamic>json)
  // {
  //   return Offer(
  //     doctorId: json['doctorId'],
  //     speciality: json['speciality'],
  //     name: json['name'],
  //     experience: json['experience'],
  //     clinic: json['clinic'],
  //     imageURL: json['imageURL'],
  //   );
  // }
}
