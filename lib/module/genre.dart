import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
class GenreResponseData with _$GenreResponseData {
  const factory GenreResponseData({required List<Genre> genres}) =
      _GenreResponseData;

  factory GenreResponseData.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseDataFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({required int id, required String name}) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
