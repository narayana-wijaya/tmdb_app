import 'package:tmdb_app/module/review.dart';
import 'package:tmdb_app/module/video.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';

abstract class MovieDetailRepository {
  Future<List<Review>> fetchReview(int page, int movieId);
  Future<Video> fetchVideo(int movieId);
}

class MovieDetailRepositoryImp implements MovieDetailRepository {
  final MovieDataSource _dataSource;

  MovieDetailRepositoryImp(this._dataSource);

  int totalPageReview = 1000;

  @override
  Future<List<Review>> fetchReview(int page, int movieId) async {
    final res = await _dataSource.fetchReview(page, movieId);
    totalPageReview = res.totalPages;
    return res.results;
  }

  @override
  Future<Video> fetchVideo(int movieId) async {
    final res = await _dataSource.fetchVideo(movieId);
    return res.results.firstWhere((element) => element.type == "Trailer");
  }
}
