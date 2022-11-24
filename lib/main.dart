import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/detail_movie.dart';

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
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$nilai',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    nilai += 1;
                  });
                },
                child: Text('Increment')),
            ElevatedButton(
                onPressed: () {
                  getHttp();
                },
                child: Text('Ambil Data')),
            Text(detailMovie != null
                ? 'Judul Movie : ${detailMovie!.title}'
                : ''),
            Text(detailMovie != null
                ? 'Overview : ${detailMovie!.overview}'
                : ''),
            Text(detailMovie != null
                ? 'Release Date : ${detailMovie!.releaseDate}'
                : '')
          ],
        ),
      ),
    );
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
