import 'package:flutter/material.dart';
import 'package:frontend_movie_store/model/objects/Movie.dart';
import 'package:frontend_movie_store/widget/MovieGridItem.dart';

class ShoppingCartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 200
        ),
        children: [
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
          MovieGridItem(movie: Movie(title: "Interstellar", imageUrl:"https://th.bing.com/th/id/OIP.IL4FgKFPzuWDTFqWAzXq2QHaLk?pid=ImgDet&rs=1" )),
        ],
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
      )
    );
  }

}