import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:movie_api/src/05/01/src/actions/get_movies.dart';
import 'package:movie_api/src/05/01/src/containers/movies_container.dart';
import 'package:movie_api/src/05/01/src/data/yts_api.dart';
import 'package:movie_api/src/05/01/src/middleware/app_middleware.dart';
import 'package:movie_api/src/05/01/src/models/app_state.dart';
import 'package:movie_api/src/05/01/src/models/movie.dart';
import 'package:redux/redux.dart';

import 'src/05/01/src/presentation/home_page.dart';
import 'src/05/01/src/reducer/reducer.dart';

void main() {
  final Client client = Client();

  final YtsApi api = YtsApi(client: client);
  
  final AppMiddleware appMiddleware = AppMiddleware(ytsApi: api);
  
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
      reducer,
      initialState: initialState,
      middleware: appMiddleware.middleware,
  );
  
  store.dispatch(const GetMovies());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key,@required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

