import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tmdb_app/presentation/genre_list_screen.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff01b4e4)),
          useMaterial3: true),
      home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: GenreListScreen(),
    );
  }
}
