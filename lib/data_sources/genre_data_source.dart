import 'package:get/get.dart';
import 'package:tmdb_app/domain/genre.dart';
import 'package:tmdb_app/tmdb_api.dart';

class GenreDataSource extends GetConnect {
  Future<List<Genre>> fetchGenre() async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');
    final response = await get(TMDBApi.genres.endpoint(), query: {
      "language": "en"
    }, headers: {
      "Authorization": "Bearer $tmdbApiKey",
      "accept": "application/json"
    });

    return GenreResponseData.fromJson(response.body).genres;
  }
}
