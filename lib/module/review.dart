import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class ReviewsResponseData with _$ReviewsResponseData {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewsResponseData(
      {required int page,
      required List<Review> results,
      required int totalPages,
      required int totalResults}) = _ReviewsResponseData;

  factory ReviewsResponseData.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseDataFromJson(json);
}

@freezed
class Review with _$Review {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Review(
      {required String author,
      required Author authorDetails,
      required String content,
      required String createdAt}) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author(double? rating) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
