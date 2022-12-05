import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:database_http/models/movie.dart';

class HttpService {
  final String apiKey = '11abba59d79f8a6405c299f9741585f4';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final response = json.decode(result.body);
      final moviesMap = response['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
      return response;
    } else {
      if (kDebugMode) {
        print("Fail");
      }
      return null;
    }
  }
}
