import 'package:frontend_movie_store/model/objects/Movie.dart';

class MoviePurchase{

  Movie movie;
  int quantity;

  MoviePurchase(this.movie, this.quantity);

  factory MoviePurchase.fromJson(Map<String, dynamic> json){
    return MoviePurchase(Movie.fromJson(json['_movie']),json['_quantity']);
  }

  Map<String, dynamic> toJson() => {
    'movie':movie,
    'quantity': quantity,
  };



  @override
  String toString(){
    return movie.toString()+" "+quantity.toString();
  }

}