import 'package:get/get.dart';
import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/module/review.dart';
import 'package:tmdb_app/module/video.dart';
import 'package:tmdb_app/tmdb_constant.dart';

class MovieDataSource extends GetConnect {
  Future<MovieResponseData> fetchMovies(int page, int genre) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response =
        await get('${TMDBConstant.baseUrl}/discover/movie', query: {
      "include_adult": "false",
      "include_video": "false",
      "language": "en-US",
      "page": "$page",
      "sort_by": "popularity.desc",
      "with_genres": "$genre"
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return MovieResponseData.fromJson(response.body);
  }

  Future<ReviewsResponseData> fetchReview(int page, int movieId) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response =
        await get('${TMDBConstant.baseUrl}/movie/$movieId/reviews', query: {
      "language": "en-US",
      "page": "$page",
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return ReviewsResponseData.fromJson(response.body);
  }

  Future<VideoResponseData> fetchVideo(int movieId) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response =
        await get('${TMDBConstant.baseUrl}/movie/$movieId/videos', query: {
      "language": "en-US",
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return VideoResponseData.fromJson(response.body);
  }
}
