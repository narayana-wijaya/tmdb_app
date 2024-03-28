import 'package:get/get.dart';
import 'package:tmdb_app/module/genre.dart';
import 'package:tmdb_app/tmdb_constant.dart';

class GenreDataSource extends GetConnect {
  Future<List<Genre>> fetchGenre() async {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');
    final response = await get(
        '${TMDBConstant.baseUrl}/genre/movie/list?language=en',
        headers: {
          "Authorization": "Bearer $tmdbApiKey",
          "accept": "application/json"
        });

    return GenreResponseData.fromJson(response.body).genres;
  }
}
