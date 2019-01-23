import 'package:app/models/movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesClient {
  final String _baseUrl = 'https://still-badlands-71873.herokuapp.com';

  Future<MoviesResponse> fetch({int page}) async {
    final response = await http.get(_baseUrl + "/api/v1/movies/?page=$page");

    if (response.statusCode == 200) {
      print(response.body);
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
