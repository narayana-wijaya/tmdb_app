import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/repository/movie_list_repository.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';

class MovieListController extends GetxController {
  ScrollController scrollController = ScrollController();
  final int genreId;
  final repo = MovieRepositoryImp(MovieDataSource());

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
    repo.totalPage = 1000;
    super.onClose();
  }

  void fetchMovies(int page) async {
    movies.addAll(await repo.fetchMovies(page, genreId));
  }

  Future<String> fetchTrailerVideo(int movieId) async {
    final video = await repo.fetchVideo(movieId);
    return video.key;
  }

  void loadMore() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          latestPage <= repo.totalPage) {
        latestPage += 1;
        fetchMovies(latestPage);
        update();
      }
    });
  }
}
