import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/widget/AmountSelector.dart';

class MovieCartItem extends StatelessWidget {
  final Movie movie;

  const MovieCartItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        top(),
      ],
    );
  }

  Widget top() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[ BoxShadow(
          color: Colors.white,
          offset: Offset.zero,
          blurRadius: 15.0,
        ),]
      ),
      child: Row(
        children: [
          Container(
            child: Image.network(movie.imageUrl,
                width: 100, fit: BoxFit.fitHeight),
          ),
          Column(
            children: [
              Text(movie.title),
              Text(movie.price.toString()),
            ],
          )
        ],
      ),
    );
  }
}
