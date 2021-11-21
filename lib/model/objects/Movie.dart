import 'Actor.dart';
import 'Genre.dart';

class Movie{
  int id;
  String title;
  String director;
  String imageUrl;
  int releaseYear;
  double price;
  int quantity;
  String description;
  List<Genre> genres;
  List<Actor> actors;

  Movie({this.id, this.title, this.director, this.imageUrl, this.releaseYear, this.price, this.quantity, this.description});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        director: json['director'],
        imageUrl: json['imageUrl'],
        releaseYear: json['releaseYear'],
        price: json['price'],
        quantity: json['quantity'],
        description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price' : price,
    'quantity': quantity
  };

  @override
  String toString() {
    return title;
  }

}