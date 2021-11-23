import 'package:flutter/material.dart';
import 'package:frontend_movie_store/pages/LoginPage.dart';
import 'package:frontend_movie_store/pages/SearchPage.dart';
import 'package:frontend_movie_store/pages/ShoppingCartPage.dart';


class Layout extends StatefulWidget{

    Layout({Key key}) : super(key:key);

    @override
    _LayoutState createState() => _LayoutState();

}

class _LayoutState extends State<Layout> {

  int _currentIndex=0;
  final List<Widget> _children=[SearchPage(), ShoppingCartPage(),LoginPageWidget()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Movie Store"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items:[
          BottomNavigationBarItem(
            icon: new Icon(Icons.home_outlined),
            label: "Home",
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