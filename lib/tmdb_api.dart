class TMDBBaseUrl {
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
  static const String baseUrl = 'https://api.themoviedb.org/3';
}

enum TMDBApi { genres, movies, reviews, videos }

extension TMDBPath on TMDBApi {
  String _path({int? id}) {
    return switch (this) {
      TMDBApi.movies => '/discover/movie',
      TMDBApi.genres => '/genre/movie/list',
      TMDBApi.reviews => '/movie/$id/reviews',
      TMDBApi.videos => '/movie/$id/videos',
    };
  }

  String endpoint({int? id}) {
    return TMDBBaseUrl.baseUrl + _path(id: id);
  }
}
