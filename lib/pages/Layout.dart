import 'package:flutter/material.dart';
import 'package:frontend_movie_store/pages/HomePage.dart';
import 'package:frontend_movie_store/pages/LoginPage.dart';
import 'package:frontend_movie_store/pages/SearchPage.dart';
import 'package:frontend_movie_store/pages/ShoppingCartPage.dart';


class MainPage extends StatefulWidget{

    MainPage({Key key}) : super(key:key);

    @override
    _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int _currentIndex=0;
  final List<Widget> _children=[HomePage(), SearchPage(), ShoppingCartPage(),LoginPageWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Ciao"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items:[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search_off_outlined),
            label:"Find"
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            label: "User",
          ),
        ]
      ),
    );
  }

  void onTabTapped(int index){
    setState((){
      _currentIndex=index;
    });
  }
}