import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';

abstract class MovieListRepository {
  Future<List<Movie>> fetchMovies(int page, int genreId);
}

class MovieRepositoryImp implements MovieListRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImp(this._dataSource);

  int totalPage = 1000;

  @override
  Future<List<Movie>> fetchMovies(int page, int genreId) async {
    final res = await _dataSource.fetchMovies(page, genreId);
    totalPage = res.totalPages;
    return res.results;
  }
}
