import 'package:dio/dio.dart';
import 'package:movie/models/list_movie.dart';

class MovieListService {
  Future<ListMovie> getMovieList() async {
    try {
      var data = await Dio().get(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=ad70b1a0982af1b93f36caa498f9bf91&page=1');
      return listMovieFromJson(data.toString());
    } catch (e) {
      print(e);
      return ListMovie();
    }
  }
}

var movieListService = MovieListService();
