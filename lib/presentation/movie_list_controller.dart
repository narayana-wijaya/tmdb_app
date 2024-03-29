import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/repository/movie_repository.dart';
import 'package:tmdb_app/services/movie_data_source.dart';

class MovieListController extends GetxController {
  ScrollController scrollController = ScrollController();
  final int genreId;

  MovieListController(this.genreId);

  final movies = <Movie>[].obs;
  int latestPage = 1;

  @override
  void onInit() {
    loadMore();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchMovies(1);
  }

  @override
  void onClose() {
    latestPage = 1;
    movies.value = [];
    super.onClose();
  }

  void fetchMovies(int page) async {
    final repo = MovieRepositoryImp(MovieDataSource());
    movies.addAll(await repo.fetchMovies(page, genreId));
  }

  void loadMore() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        latestPage += 1;
        fetchMovies(latestPage);
        update();
      }
    });
  }
}
