import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';
import 'package:frontend_movie_store/widget/MovieCartItem.dart';
import 'package:frontend_movie_store/model/Model.dart';

class ShoppingCartPage extends StatefulWidget{
  ShoppingCartPage({Key key}) : super(key:key);

  @override
  ShoppingCartPageState createState() => ShoppingCartPageState();
}

class ShoppingCartPageState extends State<ShoppingCartPage>{

  static List<MoviePurchase> movies =<MoviePurchase>[];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          top(),
          Expanded(child: bottom(),)
        ],
      );
  }

  double getTotalPrice(){
    double ret=0;
    for(int i=0; i<movies.length; i++){
      ret+=movies[i].movie.price*movies[i].quantity;
    }
    return ret;
  }

  Widget top(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Container(
            child:Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Totale provvisorio: ",style: TextStyle(fontSize: 20),),
                          Text("€"+getTotalPrice().toString(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child:Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                          gradient: null,
                          backgroundBlendMode: null),
                      child: TextButton(
                        onPressed:(){onPressed:doPurchase();}, //TODO
                        child: Text(
                          'Procedi all\'ordine',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
  Widget bottom(){
    if(movies==null || movies.length==0){
      return Container(
        child:  Center(
          child: Text("Nessun prodotto nel carrello"),
        ),
      );
    }
    return productInCart();
  }

  Widget productInCart(){
    return Flexible(child:  Container(
      child: ListView.builder(
          itemCount: movies.length,
          itemBuilder:(context,index){
            return MovieCartItem( movie: movies[index]);
          }
      ),
    ));
  }

  void doPurchase(){
    if(movies.length==0){
      _showDialog("The cart is empty");
      return;
    }
    Model.sharedInstance.doPurchase(movies).then((flag){
      setState((){
        if(flag.contains("Ok")){
          movies.clear();
          _showDialog("Thanks for the purchase");
        }
        else if(flag.contains("You must be logged in to complete a purchase")){
          _showDialog("You must be logged in first!");
        }
        else{
          _showDialog("Movie quantity not available");
        }
      });
    });
  }

  void remove(MoviePurchase moviePurchase) {
    for (int i = 0; i < ShoppingCartPageState.movies.length; i++) {
      if (ShoppingCartPageState.movies[i].movie.id == moviePurchase.movie.id) {
        if (ShoppingCartPageState.movies[i].quantity > 1) {
          ShoppingCartPageState.movies[i].quantity--;
        }
        else {
          ShoppingCartPageState.movies.remove(movies[i]);
        }
      }
    }
  }
  void _showDialog(String message){
    showDialog(
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text("Info"),
            content: new Text(message),
            backgroundColor: Colors.white,
          );
        }
    );
  }
}