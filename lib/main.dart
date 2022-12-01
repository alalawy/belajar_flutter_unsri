import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/models/detail_movie.dart';
import 'package:movie/views/home_page.dart';

void main() {
  runApp(GetMaterialApp(home: Movie()));
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
}
