import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/module/movie.dart';
import 'package:tmdb_app/presentation/movie_detail_controller.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final MovieDetailController c =
        Get.put(MovieDetailController(movieId: movie.id));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      c.thumbnailUrl.value,
                      fit: BoxFit.fill,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print('open');
                      },
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          size: 75,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.overview),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Reviews (${c.reviews.length})',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      '${movie.voteAverage.toStringAsPrecision(2)}/10 (${movie.voteCount})',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: c.reviews.length,
                      controller: c.scrollController,
                      itemBuilder: (context, index) {
                        final review = c.reviews[index];
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '${(review.authorDetails.rating ?? 0).toStringAsPrecision(2)}/10',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      review.author,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                review.content,
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
