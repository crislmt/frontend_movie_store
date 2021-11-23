import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';
import 'package:frontend_movie_store/pages/ShoppingCartPage.dart';

class AmountSelector extends StatefulWidget{

  final int quantity;
  final Movie movie;

  const AmountSelector({
    Key key,
    @required this.quantity,
    @required this.movie,
  }) : super(key: key);

  _AmountSelectorState createState() => _AmountSelectorState(movie: movie, quantity: quantity);
}

class _AmountSelectorState extends State<AmountSelector>{

  int quantity;
  Movie movie;
  int currentAmount=1;

  _AmountSelectorState({
    Key key,
    @required this.quantity,
    @required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(25),
              gradient: null,
              backgroundBlendMode: null),
          child: TextButton(
            onPressed:(){addToCart(currentAmount);}, //TODO
            child: Text(
              'Add to Cart',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 15,),
        buildOutlineButton(
          icon: Icons.remove,
          press:(){
            if(currentAmount>1){
              setState(() {
                currentAmount--;
              });
            }
          }
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(currentAmount.toString()),
        ),
        buildOutlineButton(
          icon:Icons.add,
          press:(){
            setState(() {
              if(currentAmount<quantity){
                currentAmount++;
              }
            });
          }
        )
      ]
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  void addToCart(int currentAmount){
    bool flag=false;
    for(int i=0; i<ShoppingCartPageState.movies.length; i++){
      print(ShoppingCartPageState.movies[i].movie);
      if(ShoppingCartPageState.movies[i].movie.id==movie.id){
        ShoppingCartPageState.movies[i].quantity+=currentAmount;
        flag=true;
      }
    }
    if(!flag && movie.quantity>0){
      Movie temp=new Movie(id: movie.id, quantity: 1, imageUrl: movie.imageUrl, title: movie.title, description: movie.description, director: movie.director, price: movie.price, releaseYear: movie.releaseYear);
      ShoppingCartPageState.movies.add(MoviePurchase(temp, currentAmount));
    }
  }

}