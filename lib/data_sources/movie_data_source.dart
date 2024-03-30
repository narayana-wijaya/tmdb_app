import 'package:get/get.dart';
import 'package:tmdb_app/tmdb_api.dart';

class MovieDataSource extends GetConnect {
  Future<Response<dynamic>> fetchMovies(int page, int genre) async {
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

    return response;
  }

  Future<Response<dynamic>> fetchReview(int page, int movieId) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response = await get(TMDBApi.reviews.endpoint(id: movieId), query: {
      "language": "en-US",
      "page": "$page",
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return response;
  }

  Future<Response<dynamic>> fetchVideo(int movieId) async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');

    final response = await get(TMDBApi.videos.endpoint(id: movieId), query: {
      "language": "en-US",
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return response;
  }
}
