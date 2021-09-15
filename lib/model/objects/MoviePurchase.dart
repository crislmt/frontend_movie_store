import 'package:frontend_movie_store/model/objects/Movie.dart';

class MoviePurchase{

  Movie _movie;
  int _quantity;

  MoviePurchase(this._movie, this._quantity);

  factory MoviePurchase.fromJson(Map<String, dynamic> json){
    return MoviePurchase(Movie.fromJson(json['_movie']),json['_quantity']);
  }

  Map<String, dynamic> toJson() => {
    'movie':_movie,
    'quantity': _quantity,
  };

  @override
  String toString(){
    return _movie.toString()+" "+_quantity.toString();
  }

}