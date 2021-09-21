import 'package:flutter/material.dart';
import 'package:path/path.dart ' as Path;
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/pages/MoviePage.dart';

class MovieGridItem extends StatelessWidget{

  final Movie movie;

  const MovieGridItem({
    Key key,
    @required this.movie,
  }) : super(key:key);

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){
        goToMoviePage(movie, context);
      },
      child: Container(
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
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  Wrap(
                    spacing: 2,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '\$'+'22.0',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 2,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Quantity: "+movie.quantity.toString(),
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme
                              .of(context)
                              .primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}

void goToMoviePage(Movie movie, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MoviePage(movie: movie)),
  );
}