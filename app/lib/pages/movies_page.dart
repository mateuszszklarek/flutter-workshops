import 'package:app/api/movies_client.dart';
import 'package:app/models/movie.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  @override
  State createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviesPage> {
  int _currentPage = 1;
  List<Movie> _movies = [];
  MoviesClient _client = MoviesClient();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _fetch();
    _setUpScrollListener();
  }

  void _setUpScrollListener() {
    _scrollController.addListener(() {
      if (_scrolledToEnd()) {
        _fetch();
      }
    });
  }

  bool _scrolledToEnd() =>
      _scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent;

  void _fetch() {
    _client.fetch(page: _currentPage).then((response) {
      setState(() {
        _movies.addAll(response.movies);
        _currentPage++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  child:
                      Text("Item: ${index + 1} movie: ${_movies[index].name}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
