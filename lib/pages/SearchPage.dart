import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/Model.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/widget/InputField.dart';
import 'package:frontend_movie_store/widget/MovieGridItem.dart';

class SearchPage extends StatefulWidget {

  SearchPage({Key key}) : super(key: key);


  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _searching = false;
  List<Movie> _movies;
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
      )),
    );
  }

  Widget top() {
    return Flexible(child: Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child:InputField(
        labelText: "Search",
        controller: _searchFieldController,
        onSubmit: (value){
        _search();
        },
      ))
    );
  }

  Widget bottom() {
    if(!_searching){
      if(_movies==null) return SizedBox.shrink();
      else if(_movies.length==0) return noResults();
      else return yesResults();
    }
    else
      return CircularProgressIndicator();
  }

  void _search(){
    setState((){
      _searching=true;
      _movies=null;
    });
    Model.sharedInstance.searchProductByTitle(_searchFieldController.text, _pageNumber, _pageSize, 'title').then((result){
      setState((){
        _searching=false;
        if(result==null)
          _movies=List();
        else _movies=result;
      });
    });
  }

  Widget noResults() {
    return Expanded(
      child: Text(
        "Nessun Risultato",
        style: TextStyle(
          fontSize: 50,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget yesResults() {
   return Container(
        child:GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 200
          ),
          itemCount: _movies.length,
          itemBuilder: (context, int index ){
            return MovieGridItem(movie: _movies[index]);
          },
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
        )
    );
  }

}
