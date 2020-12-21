import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_api/src/05/01/src/models/app_state.dart';
import 'package:movie_api/src/05/01/src/models/movie.dart';
import 'package:redux/redux.dart';

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Movie>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Movie>>(
      converter: (Store<AppState> store) => store.state.movies.asList(),
      builder: builder,
    );
  }
}