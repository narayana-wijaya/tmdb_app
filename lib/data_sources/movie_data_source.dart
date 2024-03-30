import 'package:get/get.dart';
import 'package:tmdb_app/domain/movie.dart';
import 'package:tmdb_app/domain/review.dart';
import 'package:tmdb_app/domain/video.dart';
import 'package:tmdb_app/tmdb_api.dart';

class MovieDataSource extends GetConnect {
  Future<MovieResponseData> fetchMovies(int page, int genre) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response = await get(TMDBApi.movies.endpoint(), query: {
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

    final response = await get(TMDBApi.reviews.endpoint(id: movieId), query: {
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

    final response = await get(TMDBApi.videos.endpoint(id: movieId), query: {
      "language": "en-US",
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return VideoResponseData.fromJson(response.body);
  }
}
