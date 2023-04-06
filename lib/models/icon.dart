class icon {
  final int iconId;
  String name;
  String imageURL;


  icon({
    this.iconId = 0,
    this.name = "q",
    this.imageURL = 'assets/demo_pic.jpg',
  });

  static List <icon> iconList =
  [
    icon(
      iconId: 0,
      name: "Mohit",
      imageURL: "assets/4.png",

    ),
    icon(
      iconId: 1,
      name: "Mohit",
      imageURL: "assets/5.png",

    ),
    icon(
      iconId: 2,
      name: "Mohit",
      imageURL: "assets/6.png",

    ),
    icon(
      iconId: 3,
      name: "Mohit",
      imageURL: "assets/7.png",

    ),
    icon(
      iconId: 4,
      name: "Mohit",
      imageURL: "assets/8.png",

    ),
  ];
}