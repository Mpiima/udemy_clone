class Course {
  final String name;
  final String shortDescription;
  final String bestseller;
  final String rating;
  final String totalRatings;
  final String totalStudents;
  final List<String> createdBy;
  final String lastUpdated;
  final List<String> languages;
  final List<String> subtitleLanguages;
  final bool discounted;
  final double discountPrice;
  final double originalPrice;
  final String whatyoulearn;
  final List<String> requirements;
  final String description;
  final List<Object> includes;
  final String image;
  final String video;
  final String category;

  Course(
      {required this.name,
      required this.shortDescription,
      required this.bestseller,
      required this.rating,
      required this.totalRatings,
      required this.totalStudents,
      required this.createdBy,
      required this.lastUpdated,
      required this.languages,
      required this.subtitleLanguages,
      required this.discounted,
      required this.discountPrice,
      required this.originalPrice,
      required this.whatyoulearn,
      required this.requirements,
      required this.description,
      required this.includes,
      required this.image,
      required this.video,
      required this.category});

  // ignore: empty_constructor_bodies
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json["name"],
      shortDescription: json["shortDescription"],
      bestseller: json["bestseller"],
      rating: json["rating"],
      totalRatings: json["totalRatings"],
      totalStudents: json["totalStudents"],
      createdBy: json["createdBy"],
      lastUpdated: json["lastUpdated"],
      languages: json["languages"],
      subtitleLanguages: json["subtitleLanguages"],
      discounted: json["discounted"],
      discountPrice: json["discountPrice"],
      originalPrice: json["originalPrice"],
      whatyoulearn: json["whatyoulearn"],
      requirements: json["requirements"],
      description: json["description"],
      includes: json["includes"],
      image: json["image"],
      video: json["video"],
      category: json["category"],
    );
  }
}
