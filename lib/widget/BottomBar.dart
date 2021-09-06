import 'package:flutter/material.dart';


class BottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation:12.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height:60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RawMaterialButton(
                  onPressed: null,
                  child: Icon(Icons.home, color: Colors.black)
              ),
              RawMaterialButton(
                  onPressed: null,
                  child: Icon(Icons.account_circle_outlined, color: Colors.black)
              )
            ],
          )
          ,
        )
      )
    );
  }
}