import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/common/api_string.dart';
import 'package:movie_app/models/movies.dart';

class ApiManager {
  Future<Movies?> getMovies() async {
    var client = http.Client();
    Movies? movieModal;
    http.Response response;

    try {
      response = await http.get(ApiStrings.popularMovieUrl);
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        movieModal = Movies.fromJson(jsonMap);
      }
    } catch (e) {
      print(e.toString());
    }
    return movieModal;
  }
}
