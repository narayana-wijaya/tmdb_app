import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieResponseData with _$MovieResponseData {
  const factory MovieResponseData(
      {required int page, required List<Movie> results}) = _MovieResponseData;

  factory MovieResponseData.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDataFromJson(json);
}

@freezed
class Movie with _$Movie {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Movie(
      {required int id,
      required String title,
      required String posterPath,
      required String overview,
      required String releaseDate,
      required int popularity,
      required int voteCount,
      required double voteAverage}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
