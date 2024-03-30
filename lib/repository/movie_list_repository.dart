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
    final res = await _dataSource.fetchMovies(page, genreId);
    totalPage = res.totalPages;
    return res.results;
  }

  @override
  Future<Video> fetchVideo(int movieId) async {
    final res = await _dataSource.fetchVideo(movieId);
    return res.results.firstWhere((element) => element.type == "Trailer");
  }
}
