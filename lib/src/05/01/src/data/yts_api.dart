import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:movie_api/src/05/01/src/models/movie.dart';
import 'package:meta/meta.dart';

class YtsApi {
  const YtsApi({@required Client client})
      : assert(client != null),
        _client = client;

  final Client _client;

  Future<List<Movie>> getMovies() async {
    final Response response = await _client.get('https://yts.mx/api/v2/list_movies.json?limit=50');

    final List<dynamic> data = jsonDecode(response.body)['data']['movies'];
    return data.map((dynamic json) => Movie.fromJson(json)).toList();
  }
}
