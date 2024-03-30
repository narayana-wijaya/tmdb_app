import 'package:get/state_manager.dart';
import 'package:tmdb_app/domain/genre.dart';
import 'package:tmdb_app/repository/genre_repository.dart';

class GenreListController extends GetxController {
  final genre = <Genre>[].obs;

  @override
  void onReady() {
    super.onReady();
    fetchGenre();
  }

  void fetchGenre() async {
    final repository = GenreRepositoryImpl();
    genre.value = await repository.fetchGenre();
  }
}
