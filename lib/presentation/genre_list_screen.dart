import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_app/presentation/genre_list_controller.dart';
import 'package:tmdb_app/presentation/movie_list_screen.dart';
import 'package:tmdb_app/repository/genre_repository.dart';

class GenreListScreen extends StatelessWidget {
  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GenreListController c = Get.put(GenreListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Genre'),
        centerTitle: false,
      ),
      body: GridView.builder(
          itemCount: c.genre.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3),
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(const MovieListScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Obx(() => Text(c.genre[index].name))),
                ),
              ),
            );
          }),
    );
  }
}
