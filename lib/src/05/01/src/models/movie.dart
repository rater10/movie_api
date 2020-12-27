library movie;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_api/src/05/01/src/models/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder b) updates]) = _$Movie;

  factory Movie.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);

  Movie._();

  String get url;

  String get title;

  int get year;

  num get rating;

  int get runtime;

  String get summary;

  @BuiltValueField(wireName: 'background_image')
  String get backgroundImage;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get mediumCoverImage;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCoverImage;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
