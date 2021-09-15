import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/widget/InputField.dart';

class SearchPage extends StatefulWidget{


  SearchPage({Key key}) : super(key:key);

  @override
  _SearchPageState createState() => _SearchPageState();

}

class _SearchPageState extends State<SearchPage> {

  bool _searching = false;
  List<Movie> _Movies;
  TextEditingController _searchFieldController = TextEditingController();

  int _pageSize = 4;
  int _pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              top(),
              bottom(),
            ],
          )
      ),
    );
  }

  Widget top() {
    return Padding(
      padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Flexible(
          child: InputField(
            labelText: "Search",
            controller: _searchFieldController,
            onSubmit: null,
          )
      )
    );
  }

  Widget bottom(){
    return Text("");
  }

}


