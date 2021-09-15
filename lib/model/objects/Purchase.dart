import 'package:frontend_movie_store/model/objects/MoviePurchase.dart';

class Purchase{

  List<MoviePurchase> _movies;

  Purchase(this._movies);

  Map<String, dynamic> toJson() =>{
    'movies' : _movies
  };

}

