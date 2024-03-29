import 'package:get/state_manager.dart';
import 'package:tmdb_app/module/genre.dart';
import 'package:tmdb_app/repository/genre_repository.dart';
import 'package:tmdb_app/data_sources/genre_data_source.dart';

class GenreListController extends GetxController {
  final genre = <Genre>[].obs;

  @override
  void onReady() {
    super.onReady();
    fetchGenre();
  }

  void fetchGenre() async {
    final repository = GenreRepositoryImpl(GenreDataSource());
    genre.value = await repository.fetchGenre();
  }
}
