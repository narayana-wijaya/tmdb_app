import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/module/review.dart';
import 'package:tmdb_app/services/movie_data_source.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies(int page, int genreId);
  Future<List<Review>> fetchReview(int page, int movieId);
}

class MovieRepositoryImp implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImp(this._dataSource);

  @override
  Future<List<Movie>> fetchMovies(int page, int genreId) async {
    print('load page: $page for genre $genreId');
    final res = await _dataSource.fetchMovies(page, genreId);
    return res.results;
  }

  @override
  Future<List<Review>> fetchReview(int page, int movieId) {
    // TODO: implement fetchReview
    throw UnimplementedError();
  }
}
