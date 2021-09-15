import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';

class MovieGridItem extends StatelessWidget{

  final Movie movie;

  const MovieGridItem({
    Key key,
    @required this.movie,
  }) : super(key:key);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 180,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(movie.imageUrl,
                      width: 250,
                      fit: BoxFit.fitHeight
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '\$'+'22.0',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}