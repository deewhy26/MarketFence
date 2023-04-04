//
// //import 'package:http/http.dart' as http;
class Offer {
  final int offerId;
  final String name;
  final String experience;
  final String clinic;
  final String speciality;
  final String imageURL;

  Offer({
    this.offerId = 0,
    this.speciality = "",
    this.name = "",
    this.experience = "0 yrs",
    this.clinic = "",
    this.imageURL = "",
  });

  static List <Offer> offerList =
  [
    Offer(
      offerId: 0,
    ),
    Offer(
      offerId: 1,
    ),
    Offer(
      offerId: 2,
    )

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
