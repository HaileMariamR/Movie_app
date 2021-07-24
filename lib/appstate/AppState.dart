import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class AppState extends ChangeNotifier {
  List _allMovies = [];
  bool isFatching = false;

  List get getAllMovies => _allMovies;

  void getMoviesFromApi(String name) async {
    String url = "https://imdb-api.com/en/API/SearchMovie/k_qn7996fq/${name} ";
    isFatching = true;
    notifyListeners();

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        _allMovies = jsondata['results'];
      }

      for (var item in _allMovies) {
        String url2 =
            "https://imdb-api.com/en/API/Ratings/k_qn7996fq/${item['id']}";

        http.Response response2 = await http.get(Uri.parse(url2));
        if (response2.statusCode == 200) {
          var jsondata2 = jsonDecode(response2.body);
          var imdb = jsondata2['imDb'];
          item["imDb"] = imdb;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    isFatching = false;
    notifyListeners();
  }
}
