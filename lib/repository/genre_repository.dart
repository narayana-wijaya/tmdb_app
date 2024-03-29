import 'package:tmdb_app/module/genre.dart';
import 'package:tmdb_app/data_sources/genre_data_source.dart';

abstract class GenreRepository {
  Future<List<Genre>> fetchGenre();
}

class GenreRepositoryImpl implements GenreRepository {
  final GenreDataSource _dataSource;

  GenreRepositoryImpl(this._dataSource);

  @override
  Future<List<Genre>> fetchGenre() async {
    return await _dataSource.fetchGenre();
  }
}
