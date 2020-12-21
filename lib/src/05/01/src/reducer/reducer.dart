import 'package:movie_api/src/05/01/src/actions/get_movies.dart';
import 'package:movie_api/src/05/01/src/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is GetMoviesSuccessful) {
    final AppStateBuilder builder = state.toBuilder();
    builder.movies.addAll(action.movies);
    return builder.build();
  }

  return state;
}