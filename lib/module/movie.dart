import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieResponseData with _$MovieResponseData {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MovieResponseData(
      {required int page,
      required List<Movie> results,
      required int totalPages,
      required int totalResults}) = _MovieResponseData;

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
      String? posterPath,
      required String overview,
      required String releaseDate,
      required double popularity,
      required int voteCount,
      required double voteAverage}) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
