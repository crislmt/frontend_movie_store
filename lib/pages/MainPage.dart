import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_movie_store/pages/LoginPageWidget.dart';
import 'package:frontend_movie_store/widget/BottomBar.dart';

class MainPage extends StatefulWidget{

    MainPage({Key? key}) : super(key:key);

    @override
    _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage>{


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add_shopping_cart_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}