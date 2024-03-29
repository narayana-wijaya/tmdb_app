import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/review.dart';
import 'package:tmdb_app/repository/movie_detail_repository.dart';
import 'package:tmdb_app/data_sources/movie_data_source.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailController extends GetxController {
  ScrollController scrollController = ScrollController();
  late YoutubePlayerController ytController;
  final int movieId;
  final String trilerId;
  final repo = MovieDetailRepositoryImp(MovieDataSource());

  MovieDetailController({required this.movieId, required this.trilerId});

  final reviews = <Review>[].obs;
  final ytId = "".obs;
  final thumbnailUrl = "".obs;
  int latestPage = 1;

  bool isPlayerReady = false;

  @override
  void onInit() {
    loadMore();
    super.onInit();
    _setupYtController();
  }

  @override
  void onReady() {
    super.onReady();
    fetchReviews(1);
  }

  @override
  void onClose() {
    latestPage = 1;
    reviews.value = [];
    repo.totalPageReview = 1000;
    super.onClose();
  }

  @override
  void dispose() {
    ytController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void fetchReviews(int page) async {
    reviews.addAll(await repo.fetchReview(page, movieId));
  }

  void loadMore() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          latestPage <= repo.totalPageReview) {
        latestPage += 1;
        fetchReviews(latestPage);
        update();
      }
    });
  }

  void _setupYtController() {
    ytController = YoutubePlayerController(
        initialVideoId: trilerId,
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            disableDragSeek: false,
            loop: false,
            forceHD: false,
            enableCaption: true))
      ..addListener(listener);
  }

  void listener() {
    if (isPlayerReady && !ytController.value.isFullScreen) {
      update();
    }
  }
}
