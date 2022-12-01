import 'package:get/get.dart';
import 'package:movie/models/list_movie.dart';
import 'package:movie/services/MovieListService.dart';

class HomeController extends GetxController {
  var listMovie = Rxn<List<Result>>();
  var listMoviePopular = Rxn<List<Result>>();

  Future<void> getMovieList() async {
    ListMovie movie = await movieListService.getMovieList();
    listMovie.value = movie.results;
  }

  Future<void> getMovieListPopular() async {
    ListMovie movie = await movieListService.getMovieListPopular();
    listMoviePopular.value = movie.results;
  }

  @override
  void onInit() {
    getMovieList();
    getMovieListPopular();
    super.onInit();
  }
}
