class Movie{
  final String title;
  final String genre;
  final String year;
  final String poster;
  final String actors;
  final String runtime;
  final String imdbRating;
  final String country;
  List<dynamic> images;
  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.poster,
    required this.actors,
    required this.runtime,
    required this.imdbRating,
    required this.country,
    required this.images
  });
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['Title'] ?? "",
      genre: json['Genre'] ?? "",
      year: json['Year'] ?? "",
      poster: json['Poster'] ?? "",
      actors: json['Actors'] ?? "",
      runtime: json['Runtime'] ?? "",
      imdbRating: json['imdbRating'] ?? "",
      country: json['Country'] ?? "",
      images: json['Images'] != null ? List<dynamic>.from(json['Images']) : [],
    );
  }
}