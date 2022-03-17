import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../network/api.dart';

// ignore: must_be_immutable
class Poster extends StatelessWidget {
  String? posterPath;
  Poster({Key? key, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (posterPath == null) {
      return Image.asset(
        "assets/image/cover.jpeg",
        scale: 1,
      );
    }
    return CachedNetworkImage(
      imageUrl: API.imageURL + posterPath!,
      placeholder: (context, url) => Image.asset(
        "assets/image/cover.jpeg",
        scale: 1,
      ),
    );
  }
}
