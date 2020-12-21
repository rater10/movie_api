import 'package:movie_api/src/05/01/src/models/movie.dart';

class GetMovies {
  const GetMovies();
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMovieError {
  const GetMovieError(this.error);

  final dynamic error;
}