class respi {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  respi({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
  });
  factory respi.fromJson(dynamic json) {
    return respi(
        name: json["name"] as String,
        images: json["images"][0]["hostedLargeUrl"] as String,
        rating: json["rating"] as double,
        totalTime: json["name"] as String);
  }
  static List<respi> recipeFromSnapshot(List snapshot) {
    return snapshot.map((data) {

      return respi.fromJson(data);
     
    }).toList();
  }
}
