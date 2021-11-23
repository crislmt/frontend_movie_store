import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';
import 'package:frontend_movie_store/pages/ShoppingCartPage.dart';
import 'package:frontend_movie_store/widget/AmountSelector.dart';

class MovieCartItem extends StatelessWidget {
  final MoviePurchase movie;

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
            border: Border.all(
              color: Colors.black12,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset.zero,
                blurRadius: 15.0,
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                child: Image.network(movie.movie.imageUrl,
                    width: 100, fit: BoxFit.fitHeight),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.movie.title),
                  SizedBox(height: 25),
                  Text(
                    "Price: " + "\$" + movie.movie.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Quantity: " + movie.quantity.toString()),
                  SizedBox(height: 10),
                  TextButton(
                     onPressed: remove,
                      child: Text(
                        "Remove",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ))
            ],
          ),
        )
    );
  }

  void remove(){
    for(int i=0; i<ShoppingCartPageState.movies.length; i++){
      if(ShoppingCartPageState.movies[i].movie.id==movie.movie.id){
        if(ShoppingCartPageState.movies[i].quantity>1) ShoppingCartPageState.movies[i].quantity--;
        else ShoppingCartPageState.movies.remove(this.movie);
      }
    }
  }
}
