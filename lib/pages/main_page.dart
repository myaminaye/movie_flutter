import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/components/movie_list.dart';
import 'package:movieapp/controllers/home_controller.dart';
// import 'package:movieapp/models/movies.dart';
// import 'package:movieapp/network/api.dart';
import 'package:movieapp/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List<Movie>? popularMovies;
  // List<Movie>? nowPlayingMovies;

  final HomeController c = Get.put(HomeController());

  // loadPopular() {
  //   API().getPopular().then((value) {
  //     setState(() {
  //       popularMovies = value;
  //     });
  //   });

  //   API().getNowPlaying().then((value) {
  //     setState(() {
  //       nowPlayingMovies = value;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    c.loadPopular();
    c.loadNowPlaying();
  }

  Widget _popularList() =>
    c.popularMovies.isEmpty ?
              const CircularProgressIndicator() :
              MovieList(list: c.popularMovies, title: 'Popular');

  Widget _nowPlayingList() =>
    c.nowPlayingMovies.isEmpty ?
              const CircularProgressIndicator() :
              MovieList(list: c.nowPlayingMovies, title: 'Now Playing');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        // body: Column(
        //   children: [
        //     popularMovies == null
        //         ? const Center(child: CircularProgressIndicator())
        //         : MovieList(
        //             list: popularMovies!,
        //             title: "Popular",
        //           ),
        //     nowPlayingMovies == null
        //         ? const Center(child: CircularProgressIndicator())
        //         : MovieList(
        //             list: nowPlayingMovies!,
        //             title: "Now Playing",
        //           )
        //   ],
        // )

        body: Obx(() {
          return Column(
            children: [
              _popularList(),
              _nowPlayingList()
            ],
          );
        }
        )
    );
  }
}
