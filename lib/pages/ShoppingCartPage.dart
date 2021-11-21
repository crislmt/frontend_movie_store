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
    return SizedBox(
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
    );
  }
  Widget bottom(){
    if(movies==null || movies.length==0){
      return Container(
        color: Colors.indigo,
        child:  Center(
          child: Text("Nessun prodotto nel carrello"),
        ),
      );
    }
    else{
      return Container(
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder:(context,index){
              return MovieCartItem(movie: movies[index].movie);
            }
        ),
      );
    }
  }

  void doPurchase(){
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

  void _showDialog(String message){
    showDialog(
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text("Attenzione!!"),
            content: new Text(message),
            backgroundColor: Theme.of(context).primaryColor,

          );
        }
    );
  }
}