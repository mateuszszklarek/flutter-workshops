class Movie {
  final int id;
  final String name;
  final String description;
  final String cover;
  final double rating;
  final String genre;

  Movie({
    this.id,
    this.name,
    this.description,
    this.cover,
    this.rating,
    this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      description: json['short_description'],
      cover: json['cover'],
      rating: json['rating'],
      genre: json['genre'],
    );
  }
}
