import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/widget/AmountSelector.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;

  const MoviePage({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                child: Stack(children: [
              Image.network(
                movie.imageUrl,
              ),
            ])),
            Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 10, 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Price: \$" + movie.price.toString()),
              ),
            ),
            Container(
              child: ExpansionTile(
                title: Text("Description"),
                children: [
                  Text(
                    movie.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(height: 1.5, color: Color(0xFF677A8C)),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(25),
                        gradient: null,
                        backgroundBlendMode: null),
                    child: TextButton(
                      onPressed: null, //TODO
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  AmountSelector(quantity: movie.quantity),
                ],
              )
            ),
          ],
        )));
  }
}
