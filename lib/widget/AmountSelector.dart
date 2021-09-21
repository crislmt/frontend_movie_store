import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountSelector extends StatefulWidget{

  final int quantity;

  const AmountSelector({
    Key key,
    @required this.quantity,
  }) : super(key: key);

  _AmountSelectorState createState() => _AmountSelectorState(quantity: quantity);
}

class _AmountSelectorState extends State<AmountSelector>{

  final int quantity;
  int currentAmount;

  _AmountSelectorState({
    Key key,
    @required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        buildOutlineButton(
          icon: Icons.remove,
          press:(){
            if(currentAmount>1){
              setState(() {
                currentAmount--;
              });
            }
          }
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(currentAmount.toString()),
        ),
        buildOutlineButton(
          icon:Icons.add,
          press:(){
            setState(() {
              if(currentAmount<quantity){
                currentAmount++;
              }
            });
          }
        )
      ]
    );
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

}