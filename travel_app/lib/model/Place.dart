class Place {
  String name;
  String description;
  double price;
  int stars;
  int people;
  int selectedPeople;
  String img;
  String proPic;
  String location;

  Place({
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.selectedPeople,
    required this.img,
    required this.proPic,
    required this.location,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        people: json["people"],
        selectedPeople: json["selectedPeople"],
        img: json["img"],
        proPic: json["proPic"],
        location: json["location"]);
  }
}
