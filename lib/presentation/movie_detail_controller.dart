import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/review.dart';
import 'package:tmdb_app/repository/movie_detail_repository.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';

class MovieDetailController extends GetxController {
  ScrollController scrollController = ScrollController();
  final int movieId;
  final repo = MovieDetailRepositoryImp(MovieDataSource());

  MovieDetailController({required this.movieId});

  final reviews = <Review>[].obs;
  final trailerUrl = "".obs;
  final thumbnailUrl = "".obs;
  int latestPage = 1;

  @override
  void onInit() {
    loadMore();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchReviews(1);
    fetchTrailerVideo();
  }

  @override
  void onClose() {
    latestPage = 1;
    reviews.value = [];
    repo.totalPageReview = 1000;
    super.onClose();
  }

  void fetchReviews(int page) async {
    reviews.addAll(await repo.fetchReview(page, movieId));
  }

  void loadMore() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          latestPage <= repo.totalPageReview) {
        print("load");
        latestPage += 1;
        fetchReviews(latestPage);
        update();
      }
    });
  }

  void fetchTrailerVideo() async {
    final video = await repo.fetchVideo(movieId);
    print(video.key);
    trailerUrl.value = 'https://www.youtube.com/watch?v=${video.key}';
    thumbnailUrl.value = 'https://img.youtube.com/vi/${video.key}/0.jpg';
  }
}
