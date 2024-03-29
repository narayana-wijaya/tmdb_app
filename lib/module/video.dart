import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class VideoResponseData with _$VideoResponseData {
  const factory VideoResponseData({required List<Video> results}) =
      _VideoResponseData;

  factory VideoResponseData.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseDataFromJson(json);
}

@freezed
class Video with _$Video {
  factory Video(
      {required String type,
      required String key,
      required String id,
      required String site,
      required String name}) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
