import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/genre.dart';
import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/presentation/movie_detail_screen.dart';
import 'package:tmdb_app/presentation/movie_list_controller.dart';
import 'package:tmdb_app/tmdb_constant.dart';

class MovieListScreen extends StatelessWidget {
  final Genre genre;

  const MovieListScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final MovieListController c = Get.put(MovieListController(genre.id));
    return Scaffold(
      appBar: AppBar(title: Text(genre.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => GridView.builder(
            controller: c.scrollController,
            itemCount: c.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.55),
            itemBuilder: (BuildContext ctx, int index) {
              return _buildMovieCard(c.movies[index]);
            })),
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return GestureDetector(
      onTap: () {
        Get.to(MovieDetailScreen(movie: movie));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: movie.posterPath == null
                    ? const Center(
                        child: Icon(Icons.movie),
                      )
                    : Image.network(
                        TMDBConstant.imagePath + movie.posterPath!,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 2),
            )
          ],
        ),
      ),
    );
  }
}
