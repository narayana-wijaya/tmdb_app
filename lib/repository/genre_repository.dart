import 'package:tmdb_app/module/genre.dart';
import 'package:tmdb_app/services/genre_data_sources.dart';

abstract class GenreRepository {
  Future<List<Genre>> fetchGenre();

  Future<void> setGenre(Genre genre);
}

class GenreRepositoryImpl implements GenreRepository {
  final GenreDataSource _dataSource;

  GenreRepositoryImpl(this._dataSource);

  @override
  Future<List<Genre>> fetchGenre() async {
    return await _dataSource.fetchGenre();
  }

  @override
  Future<void> setGenre(Genre genre) async {
    return;
  }
}
