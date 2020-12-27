import 'package:flutter/cupertino.dart';
import 'package:movie_api/src/05/01/src/actions/get_movies.dart';
import 'package:movie_api/src/05/01/src/data/yts_api.dart';
import 'package:meta/meta.dart';
import 'package:movie_api/src/05/01/src/models/app_state.dart';
import 'package:movie_api/src/05/01/src/models/movie.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getMoviesMiddleware,
    ];
  }

  Future<void> _getMoviesMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is! GetMovies) {
      return;
    }

    try {
      final List<Movie> movies = await _ytsApi.getMovies();
      final GetMoviesSuccessful successful = GetMoviesSuccessful(movies);
      store.dispatch(successful);
    } catch (e) {
      final GetMovieError error = GetMovieError(e);
      store.dispatch(error);
    }
  }
}