import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/detail_movie.dart';
import 'package:movie/views/home_page.dart';

void main() {
  runApp(MaterialApp(home: Movie()));
}

class Movie extends StatefulWidget {
  Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  int nilai = 0;

  DetailMovie? detailMovie;

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }

  void getHttp() async {
    try {
      var data = await Dio().get(
          'https://api.themoviedb.org/3/movie/550?api_key=ad70b1a0982af1b93f36caa498f9bf91');

      setState(() {
        detailMovie = DetailMovie.fromJson(jsonDecode(data.toString()));
      });
    } catch (e) {
      print(e);
    }
  }
}
