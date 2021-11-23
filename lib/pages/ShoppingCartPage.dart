import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';
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
          bottom(),
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
                          Text("Total : ",style: TextStyle(fontSize: 20),),
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
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(10),
                          gradient: null,
                          backgroundBlendMode: null),
                      child: TextButton(
                        onPressed:(){onPressed:doPurchase();}, //TODO
                        child: Text(
                          'Place your order',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
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
          child: Text("The cart is empty"),
          heightFactor: 10,
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
            return MovieCartItem(movies[index]);
          }
      ),
    ));
  }

  Widget MovieCartItem(MoviePurchase movie){
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
                          onPressed: (){
                            remove(movie);
                          },
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
    setState(() {
      for (int i = 0; i < movies.length; i++) {
        if (movies[i].movie.id == moviePurchase.movie.id) {
          if (movies[i].quantity > 1) {
            movies[i].quantity--;
          }
          else {
            movies.remove(movies[i]);
          }
        }
      }
    });
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