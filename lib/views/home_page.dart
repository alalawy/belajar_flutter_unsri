import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie/controllers/home_controller.dart';
import 'package:movie/models/list_movie.dart';
import 'package:movie/services/MovieListService.dart';
import 'package:movie/views/detail_movie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var movies = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.bar_chart,
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://cdn.pixabay.com/photo/2018/05/11/22/49/wild-west-3391959_960_720.jpg',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello James,',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Book Your Favorite Movie.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 350,
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.listMovie()!.length,
                        itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => Get.to(() => DetailMovie()),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Container(
                                      width: 250,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movies.listMovie()![index].posterPath}')
                                                  .image)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    '${movies.listMovie()![index].title}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Populer',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Obx((() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies.listMoviePopular()!.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Container(
                              width: 100,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movies.listMoviePopular()![index].posterPath}')
                                          .image)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  '${movies.listMoviePopular()![index].title}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Action, Comedy, Thriller',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })))
            ],
          ),
        ),
      ),
    );
  }
}
