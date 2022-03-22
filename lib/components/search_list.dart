// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/components/posterpath.dart';
import '../models/movies.dart';
import '../pages/detail_page.dart';
// import '../network/api.dart';

// ignore: must_be_immutable
class SearchList extends StatefulWidget {
  List<Movie> list;
  SearchList({Key? key, required this.list}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        Movie m = widget.list[index];
        return InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((context) => DetailPage(
            //               movie: m,
            //               heroTag: "${m.id}Search",
            //             ))));
            Get.to(() => DetailPage(
                  movie: m,
                  heroTag: "${m.id}Search",
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 180,
                  child: Hero(
                      tag: "${m.id}Search",
                      child: Poster(posterPath: m.posterPath)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(m.title),
                      m.releaseDate != null
                          ? Text("${m.releaseDate!.year}")
                          : const Text("")
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  } //build
}//_SearchListState
