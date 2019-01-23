import 'package:app/models/movie.dart';

class MoviesResponse {
  final int count;
  final String nextPage;
  final String previousPage;
  final List<Movie> movies;

  MoviesResponse({
    this.count,
    this.nextPage,
    this.previousPage,
    this.movies,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      count: json['count'],
      nextPage: json['next'],
      previousPage: json['previous'],
      movies: (json['results'] as List)
          .map<Movie>((movie) => Movie.fromJson(movie))
          .toList(),
    );
  }
}
