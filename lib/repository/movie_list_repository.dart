import 'package:tmdb_app/domain/movie.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';
import 'package:tmdb_app/domain/video.dart';

abstract class MovieListRepository {
  Future<List<Movie>> fetchMovies(int page, int genreId);
  Future<Video> fetchVideo(int movieId);
}

class MovieRepositoryImp implements MovieListRepository {
  final MovieDataSource _dataSource = MovieDataSource();

  MovieRepositoryImp();

  int totalPage = 1000;

  @override
  Future<List<Movie>> fetchMovies(int page, int genreId) async {
    final response = await _dataSource.fetchMovies(page, genreId);
    final data = MovieResponseData.fromJson(response.body);
    totalPage = data.totalPages;
    return data.results;
  }

  @override
  Future<Video> fetchVideo(int movieId) async {
    final res = await _dataSource.fetchVideo(movieId);
    final data = VideoResponseData.fromJson(res.body);
    return data.results.firstWhere((element) => element.type == "Trailer");
  }
}
