class ApiStrings {
  static const String myApiKey = "dae03573ae5f94a9dc5f0f1ea18b7263";
  static const String popularMovieApiKey =
      "https://api.themoviedb.org/3/movie/popular?api_key=$myApiKey";

  static var popularMovieUrl = Uri.parse(popularMovieApiKey);
}
