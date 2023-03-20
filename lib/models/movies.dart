import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  Movies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        results:
            List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "totalPages": totalPages,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Results {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  String id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  String voteAverage;
  String voteCount;

  Results({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"].toString(),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toString(),
        voteCount: json["vote_count"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdropPath": backdropPath,
        "genreIds": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "originalLanguage": originalLanguage,
        "originalTitle": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "posterPath": posterPath,
        "releaseDate": releaseDate,
        "title": title,
        "video": video,
        "voteAverage": voteAverage,
        "voteCount": voteCount,
      };
}

enum OriginalLanguage { EN, ES, CN }

final originalLanguageValues = EnumValues({
  "cn": OriginalLanguage.CN,
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
