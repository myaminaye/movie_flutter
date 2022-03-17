import 'package:flutter/material.dart';
import 'package:movieapp/components/search_list.dart';
import 'package:movieapp/network/api.dart';

import '../models/movies.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var movieAPI = API();
  List<Movie>? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height:45,
          child: TextField(
            style: const TextStyle(color: Colors.indigo),
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              movieAPI.getSearch(value).then((value) {
                setState(() {
                  result = value;
                  // print(result!.length);
                });
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
                // icon: Icon(Icons.search, color: Colors.white),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.indigo)),
          ),
        ),
      ),
      body: result == null
          ? const Text("Please Search First")
          : SearchList(list: result!),
    );
  }
}
